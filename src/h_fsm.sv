/* 
 *
 * Mealy H Sync Machine.
 *
 * @file  h_fsm.sv
 * @autor Luis Arturo Mora Granados
 * @date  20/09/2018
 */

module h_fsm #
(
   parameter HBP     = 10'd48,
	parameter HACTIVE = 10'd635,
	parameter HSYN    = 10'd95,
	parameter HFP 	   = 10'd15
)
(
	input logic clk_i, rst_i, str_i,
	input logic [9:0] cnt_i,
	output logic busy_o, sync_o, rst_o, ena_o, dsp_o
);
	typedef enum logic [2:0] {S0, S1, S2, S3, S4} statetype;
	statetype state, nextstate;
	always_ff @(posedge clk_i, posedge rst_i)
		if (rst_i) state <= S0;
		else       state <= nextstate;
	
	always_comb
		case (state)
			//...WAIT
			S0:
				if(str_i)
					nextstate = S1;
				else
				   nextstate = S0;
			
			//...DISPLAY
			S1:
				if(cnt_i >= HBP)
					nextstate = S2;
				else
				   nextstate = S1;
			
			//...FRONT-PORCH
			S2:
			   if(cnt_i >= HBP + HACTIVE)
				    nextstate = S3;
				else
				    nextstate = S2;
			
			//...SYNC
			S3:
			   if(cnt_i >= HBP + HACTIVE + HSYN) 
				    nextstate = S4;
				else
				    nextstate = S3;
			
			//...MAX
			S4:
			   if(cnt_i >= HBP + HACTIVE + HSYN + HFP - 1) 
				    nextstate = S0;
				else
				    nextstate = S4;
			
			default:
			       nextstate = S0;
	endcase
	
	assign busy_o = (state != S0);
	assign hs_o   = (state == S3);
	assign rst_o  = (state == S0);
	assign ena_o  = (state != S0);
	assign dsp_o  = (state == S1);
	
endmodule
