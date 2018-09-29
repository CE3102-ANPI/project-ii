module vga_controller_tb();

   logic clk_i, rst_i;
	logic [19:0] bus_i;
	logic hs_o, vs_o, blank_o, sync_o;
	logic [9:0] addr_o;
	logic [7:0] r_o, g_o, b_o;
	
	vga_controller dut(clk_i, rst_i, bus_i, 
	                   hs_o, vs_o, blank_o, sync_o, addr_o, r_o, g_o, b_o);
	initial begin
	    clk_i = 0;
		 rst_i = 1;
		 #20000 rst_i = 0;
	end
	
	always #10000 clk_i = ~clk_i;
endmodule
