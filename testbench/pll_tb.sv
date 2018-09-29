module pll_tb();

	logic clk_i, rst_i, ena_i, clk_o;
	initial begin
		clk_i = 0;
		ena_i = 1;
		rst_i = 1;
		#400 rst_i = 0;
	end
	always #200 clk_i = ~clk_i;
	pll#(4) uut (clk_i, rst_i, ena_i, clk_o);
endmodule