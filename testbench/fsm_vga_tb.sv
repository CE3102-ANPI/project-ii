module fsm_vga_tb();
   logic clk_i, rst_i;
	logic [9:0] h_cnt_i, v_cnt_i;
	logic hs_o, vs_o, d_ena_o, h_rst_o, v_rst_o, h_ena_o, v_ena_o;
	
	counter#(10) h_pixel_cnt(clk_i, h_rst_o, h_ena_o, h_cnt_i);
	counter#(10) v_pixel_cnt(clk_i, v_rst_o, v_ena_o, v_cnt_i);
	
   fsm_vga dut(clk_i, rst_i, h_cnt_i, v_cnt_i,
		        hs_o, vs_o, d_ena_o, h_rst_o, v_rst_o, h_ena_o, v_ena_o);
	
	initial begin
	    clk_i = 0;
		 rst_i = 1;
		 #40000 rst_i = 0;
	end
	
	always #20000 clk_i = ~clk_i;
	
endmodule
