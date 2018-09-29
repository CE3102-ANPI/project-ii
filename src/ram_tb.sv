module ram_tb();
	logic clk_i, write_ena_i;
	logic [3:0] w_addr_i, r_addr_i;
	logic [7:0] bus_data_i, bus_data_o;
	ram #(4,8) dut (clk_i,write_ena_i,
						w_addr_i,r_addr_i,
						bus_data_i,bus_data_o);
	initial begin 
		clk_i=1;
		w_addr_i=3;
		write_ena_i=1;
		bus_data_i=8'b1101101;
		#40000
		r_addr_i=3;
		#40000
		bus_data_i=bus_data_o;
		bus_data_i[0]=0;
		#40000
		bus_data_i[2]=0;
		#40000
		bus_data_i[6]=0;
		
		
	end
	
	always #20000 clk_i = ~clk_i;
	
		
endmodule



