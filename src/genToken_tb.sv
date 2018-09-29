

module genToken_tb();
	logic clk_i,rst,write_ena_i;
	
	logic [4:0] addr_ram_board,address_dummy;
	logic [9:0] bus_data_o_ram_board,buss_dummy;
	 
	
	genToken dut(clk_i,rst,addr_ram_board,bus_data_o_ram_board);
	ram #(4,10) dut2 (clk_i,write_ena_i,
						addr_ram_board,address_dummy,
						bus_data_o_ram_board,buss_dummy);
	
	initial begin 
		clk_i=1;
		rst=1;
		write_ena_i=1;
		#10000
		rst=0;
	end
	
	always #20000 clk_i = ~clk_i;
	
		
endmodule
