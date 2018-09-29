/* 
 *
 * Testing an fsm that writes on the ram
 *
 * @file  ram_tb_fsm.sv
 * @autor Victor Montero
 * @date  20/09/2018
*/

/*
module ram_tb_fsm();
	logic clk_i, write_ena_i,reset;
	logic [5:0] w_addr_i, r_addr_i;
	logic [10:0] bus_data_i, bus_data_o;
	ram #(4,8) dut (clk_i,write_ena_i,
						w_addr_i,r_addr_i,
						bus_data_i,bus_data_o);
						
	typedef enum logic [1:0] {S0, S1, S2,S3} statetype;
	statetype state, nextstate;
	// state register
	always_ff @(posedge clk_i, posedge reset)
		if (reset) state <= S0;
		else       state <= nextstate;					
	
 begin
		clk_i=1;
		reset=0;
		w_addr_i=0;
		write_ena_i=0;
		bus_data_i=10'b1110000000;
		case (state)
			S0: 
				begin
					w_addr_i=1;
					write_ena_i=1;
					bus_data_i=10'b1110000000;
					reset=0;
					nextstate = S1;
				end
			S1: 
				begin
					w_addr_i=2;
					write_ena_i=1;
					bus_data_i=10'b0001110000;
					reset=0;
					nextstate = S2;
				end
			S2: 
				begin
					w_addr_i=3;
					write_ena_i=1;
					bus_data_i=10'b0000001110;
					reset=0;
					nextstate = S3;
				end	
			S3: 
				begin
					w_addr_i=4;
					write_ena_i=1;
					bus_data_i=10'b0000000001;
					reset=0;
					nextstate = S0;
				end	
			default:   nextstate = S0;
	endcase
	end 
	
	//#2000000
	begin
		r_addr_i=0;
		#40000
		r_addr_i=1;
		#40000
		r_addr_i=2;
		#40000
		r_addr_i=3;
		#40000
		r_addr_i=4;
		#40000
	
	end
	
	always #20000 clk_i = ~clk_i;
	
		
endmodule*/



