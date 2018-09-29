

module genToken_tb();
	logic clk_i,rst;
	
	logic [4:0] addr_ram_board;
	logic [9:0] bus_data_o_ram_board;
	genToken dut(clk_i,rst,addr_ram_board,bus_data_o_ram_board);
	
	
	initial begin 
		clk_i=1;
		rst=1;
		#10000
		rst=0;
	end
	
	always #20000 clk_i = ~clk_i;
	
		
endmodule
