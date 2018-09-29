module h_fsm_tb();
   
	logic clk_i, rst_i, str_i;
	logic [9:0] h_cnt_i;
	logic busy_o, hs_o, h_rst_o, h_ena_o, h_dsp_o;
	
	h_fsm dut(clk_i, rst_i, str_i, h_cnt_i,
	          busy_o, hs_o, h_rst_o, h_ena_o, h_dsp_o);
	counter#(10) cut(clk_i, h_rst_o, h_ena_o, h_cnt_i);
	          
	initial begin
	    clk_i = 0;
		 rst_i = 1;
		 str_i = 0;
		 #40 
		 rst_i = 0;
		 str_i = 1;
	end
	
	always #20 clk_i = ~clk_i;
	
endmodule
