/* 
 *
 * FSM
 *
 * @file  fsm_vga.sv
 * @autor Luis Arturo Mora Granados
 * @date  20/09/2018
 */

module vga_fsm #
(
   parameter HBP     = 10'd48,
	parameter HACTIVE = 10'd635,
	parameter HFP 	   = 10'd15,
	parameter HSYN    = 10'd95,
	
	parameter VBP     = 10'd33,
	parameter VACTIVE = 10'd480,
	parameter VFP     = 10'd10,
	parameter VSYN    = 10'd2
)
(
	input logic clk_i, rst_i,
	input logic [9:0] h_cnt_i, v_cnt_i,
	output logic hs_o, vs_o, d_ena_o, h_rst_o, v_rst_o, h_ena_o, v_ena_o
);
	typedef enum logic [2:0] {S0, S1, S2, S3, S4, S5, S6, S7} statetype;
	statetype state, nextstate;
	
	always_ff @(posedge clk_i, posedge rst_i)
		if (rst_i) state <= S0;
		else       state <= nextstate;
		
	always_comb
		case (state)
		
		   //Reset
			S0:
				if(rst_i) 
					nextstate = S1;
				else
				   nextstate = S0;
		   
			//Back-Porch
			S0:
				if(h_cnt_i > HBP && v_cnt_i > VBP) 
					nextstate = S1;
				else
				   nextstate = S0;
			
			//Display
			S1:
			        if(h_cnt_i > HBP + HACTIVE || 
					     v_cnt_i > VBP + VACTIVE)
				    nextstate = S2;
				else
				    nextstate = S1;

		   //Front-Porch			 
			S2:
			        if(h_cnt_i > HBP + HACTIVE + HFP)
				    nextstate = S4;
				else if(v_cnt_i > VBP + VACTIVE + VFP)
				    nextstate = S3;
				else
				    nextstate = S2;
					 
		   //Sync-H		 
			S3:
			   if(h_cnt_i > HBP + HACTIVE + HFP + HSYN)
				    nextstate = S1;
				else
				    nextstate = S3;
					 
		   //Sync-V			 
			S4:
			   if(v_cnt_i > VBP + VACTIVE + VFP + VSYN)
				    nextstate = S1;
				else
				    nextstate = S4;
				 
			default:
			       nextstate = S0;
	endcase
	
endmodule
