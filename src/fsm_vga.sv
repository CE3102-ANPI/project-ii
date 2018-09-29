/* 
 *
 * FSM Mealy Machine for counters.
 *
 * @file  fsm_vga.sv
 * @autor Luis Arturo Mora Granados
 * @date  20/09/2018
 */

module fsm_vga #
(
	parameter HACTIVE = 10'd635,
	parameter HFP 	   = 10'd15,
	parameter HSYN    = 10'd95,
	parameter HBP     = 10'd48,
	parameter HSS     = HACTIVE + HFP,
	parameter HSE     = HSS + HSYN,
	parameter HMAX    = HSE + HBP,
	parameter VACTIVE = 10'd480,
	parameter VFP     = 10'd10,
	parameter VSYN    = 10'd2,
	parameter VBP     = 10'd33,
	parameter VSS     = VACTIVE + VFP,
	parameter VSE     = VSS + VSYN,
	parameter VMAX    = VSE + VBP
)
(
	input logic clk_i, rst_i,
	input logic [9:0] h_cnt_i, v_cnt_i,
	output logic hs_o, vs_o, d_ena_o, h_rst_o, v_rst_o, h_ena_o, v_ena_o
);
	typedef enum logic [3:0] {S0, S1, S2, S3, S4, S5, S6, S7, S8} statetype;
	statetype state, nextstate;
	
	always_ff @(posedge clk_i, posedge rst_i)
		if (rst_i) state <= S0;
		else       state <= nextstate;
		
	always_comb
		case (state)
		   
			// RESET
			S0:
				if(~rst_i) 
					nextstate = S1;
				else
				   nextstate = S0;
					
			// DISPLAY
			S1:
				if(h_cnt_i >= HACTIVE || v_cnt_i >= VACTIVE) 
					nextstate = S2;
				else
				   nextstate = S1;
					
			//...BLANK
			S2:
			        if(v_cnt_i >= VMAX)
				    nextstate = S7;
			   else if(h_cnt_i >= HMAX)
				    nextstate = S6;
			   else if(v_cnt_i >= VSS && v_cnt_i < VSE)
				    nextstate = S4;
				else if(h_cnt_i >= HSS && h_cnt_i < HSE)
				    nextstate = S3;
				else
				    nextstate = S2;
			
			//...H-SYNC
			S3:
			   if(h_cnt_i >= HSE) 
				    nextstate = S2;
			   else if(v_cnt_i >= VSS && v_cnt_i < VSE)
				    nextstate = S5;
				else
				    nextstate = S3;
			
			//...V-SYNC
			S4:
			        if(h_cnt_i >= HSS && h_cnt_i < HSE)
				    nextstate = S5;
			   else if(h_cnt_i >= HMAX)
				    nextstate = S8;
			   else if(v_cnt_i >= VSE) 
				    nextstate = S2;
				else
				    nextstate = S4;
			
			//...H & V SYNC
			S5:
			        if(v_cnt_i >= VSS && v_cnt_i < VSE && 
					     h_cnt_i >= HSS && h_cnt_i < HSE)
				    nextstate = S5;
			   else if(h_cnt_i >= HSE && 
				        v_cnt_i >= VSS && v_cnt_i < VSE) 
				    nextstate = S4;
				else
				    nextstate = S3;
					 
			//...H MAX
			S6:
			   if(h_cnt_i == 0 && v_cnt_i < VACTIVE)
				    nextstate = S1;
				else
				    nextstate = S2;
					 
			//...V MAX
			S7: 
		      if(v_cnt_i == 0)
				    nextstate = S1;
				else
				    nextstate = S7;
					 
			//...V-SYNC&&HMAX
			S8: 
		      if(v_cnt_i >= VSE)
				    nextstate = S2;
				else if(v_cnt_i < VSE)
				    nextstate = S4;
				else
				    nextstate = S8;
			
			default:
			       nextstate = S0;
	endcase
	
	assign hs_o    = state == S3 || state == S5;
	assign vs_o    = state == S4 || state == S5 || state == S8;
	assign d_ena_o = state == S1;
	assign h_rst_o = state == S0 || state == S6 || state == S7 || state == S8;
	assign v_rst_o = state == S0 || state == S7;
	assign h_ena_o = state != S0 && state != S6 && state != S7;
	assign v_ena_o = state == S6 || state == S8;
	
endmodule
