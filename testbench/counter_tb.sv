module counter_tb();

	logic clk_i, rst_i, ena_i;
	logic [3:0] q;
	counter#(4) uut (clk_i, rst_i, ena_i, q);	
	initial begin
		clk_i = 0;
		ena_i = 1;
		rst_i = 1;
		#400 rst_i = 0;
	end
	always #200 clk_i = ~clk_i;
endmodule
