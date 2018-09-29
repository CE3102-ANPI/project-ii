module eraseRow_tb();

	logic clk, reset,start;
	logic [4:0] read_address, write_address;
	logic [9:0] bus_data_i, bus_data_o;
	
	eraseRow DUT(clk, reset, start, read_address, write_adress, bus_data_i, bis_data_o);
	
	initial begin
	#5 clk = 0;
	reset = 0;
	start = 1;
	
	end
	always
		#5 clk = ~clk;
	
endmodule
	