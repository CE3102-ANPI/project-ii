module counterwe_tb();

	logic clk_i,rst,e;
	logic [3:0] q_o;

	counterwe#(4) dut (clk_i,rst,e,q_o);

	initial begin
		clk_i=1;
		rst=1;
		#1000;
		rst=0;
		e=1;
		#480000;
		e=0;
		#60000;
		e=1;
	
	end

	always #20000 clk_i = ~clk_i;
			
endmodule