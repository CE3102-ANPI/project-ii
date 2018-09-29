 /* 
  *
  * Token generation fsm.
  *
  * @file  eraseRow.sv
  * @autor NestorBaltodano
  * @date  21/09/2018
  */
  
module eraseRow
  (
	input logic clk, reset,start,
	output logic [4:0] read_address, write_address,
	output logic [9:0] bus_data_i, bus_data_o
  );
  
	typedef enum logic [5:0] {S32, S31, S22, S21, S20, S19, S18, S17, S16, S15, S14, S13, S12, S11, S10, S9, S8, S7, S6, S5, S4, S3} statetype;
	statetype state, nextstate;
	// state register
	always_ff @(posedge clk, posedge reset)
		if (reset) state <= S32;
		else       state <= nextstate;
	// next state logic
	always_comb begin//maquina de estados, en cada estado se pinta una linea de la ficha en la matriz
		case (state)
			S32:	if (start) 
						nextstate=S22;
					else
						nextstate=S32;
			
			S22:	nextstate = S21;			
			S21:	nextstate = S20;					
			S20:	nextstate = S19;
			S19:	nextstate = S18;
			S18:	nextstate = S17;
			S17:	nextstate = S16;
			S16:	nextstate = S15;
			S15:	nextstate = S14;
			S14:	nextstate = S13;
			S13:	nextstate = S12;
			S12:	nextstate = S11;
			S11:	nextstate = S10;
			S10:	nextstate = S9;
			S9:	nextstate = S8;
			S8:	nextstate = S7;
			S7:	nextstate = S6;
			S6:	nextstate = S5;
			S5:	nextstate = S4;
			S4:	nextstate = S3;
			S3:	nextstate = S22;
		endcase
	end
	
	//output logic

	always_latch begin
		case (state) 
			S22:begin
				write_address=22;
				if (bus_data_i ==10'b11111111111) 
					begin
						bus_data_o=10'b0000000000;
						read_address = write_address;
					end
				else
					begin
						read_address = 21;
					end
				end
				
			S21:begin
				write_address=21;
				if (bus_data_i ==10'b11111111111) 
					begin
						bus_data_o=10'b0000000000;
						read_address = write_address;
					end
				else
					begin
						read_address = 20;
					end
				end

			S20:begin
				write_address=20;
				if (bus_data_i ==10'b11111111111) 
					begin
						bus_data_o=10'b0000000000;
						read_address = write_address;
					end
				else
					begin
						read_address = 19;
					end
				end

			S19:begin
				write_address=19;
				if (bus_data_i ==10'b11111111111) 
					begin
						bus_data_o=10'b0000000000;
						read_address = write_address;
					end
				else
					begin
						read_address = 18;
					end
				end

			S18:begin
				write_address=18;
				if (bus_data_i ==10'b11111111111) 
					begin
						bus_data_o=10'b0000000000;
						read_address = write_address;
					end
				else
					begin
						read_address = 17;
					end
				end

			S17:begin
				write_address=17;
				if (bus_data_i ==10'b11111111111) 
					begin
						bus_data_o=10'b0000000000;
						read_address = write_address;
					end
				else
					begin
						read_address = 16;
					end
				end

			S16:begin
				write_address=16;
				if (bus_data_i ==10'b11111111111) 
					begin
						bus_data_o=10'b0000000000;
						read_address = write_address;
					end
				else
					begin
						read_address = 15;
					end
				end

			S15:begin
				write_address=15;
				if (bus_data_i ==10'b11111111111) 
					begin
						bus_data_o=10'b0000000000;
						read_address = write_address;
					end
				else
					begin
						read_address = 14;
					end
				end

			S14:begin
				write_address=14;
				if (bus_data_i ==10'b11111111111) 
					begin
						bus_data_o=10'b0000000000;
						read_address = write_address;
					end
				else
					begin
						read_address = 13;
					end
				end

			S13:begin
				write_address=13;
				if (bus_data_i ==10'b11111111111) 
					begin
						bus_data_o=10'b0000000000;
						read_address = write_address;
					end
				else
					begin
						read_address = 12;
					end
				end

			S12:begin
				write_address=12;
				if (bus_data_i ==10'b11111111111) 
					begin
						bus_data_o=10'b0000000000;
						read_address = write_address;
					end
				else
					begin
						read_address = 11;
					end
				end

			S11:begin
				write_address=11;
				if (bus_data_i ==10'b11111111111) 
					begin
						bus_data_o=10'b0000000000;
						read_address = write_address;
					end
				else
					begin
						read_address = 10;
					end
				end

			S10:begin
				write_address=10;
				if (bus_data_i ==10'b11111111111) 
					begin
						bus_data_o=10'b0000000000;
						read_address = write_address;
					end
				else
					begin
						read_address = 9;
					end
				end

			S9:begin
				write_address=9;
				if (bus_data_i ==10'b11111111111) 
					begin
						bus_data_o=10'b0000000000;
						read_address = write_address;
					end
				else
					begin
						read_address = 8;
					end
				end

			S8:begin
				write_address=8;
				if (bus_data_i ==10'b11111111111) 
					begin
						bus_data_o=10'b0000000000;
						read_address = write_address;
					end
				else
					begin
						read_address = 7;
					end
				end

			S7:begin
				write_address=7;
				if (bus_data_i ==10'b11111111111) 
					begin
						bus_data_o=10'b0000000000;
						read_address = write_address;
					end
				else
					begin
						read_address = 6;
					end
				end

			S6:begin
				write_address=6;
				if (bus_data_i ==10'b11111111111) 
					begin
						bus_data_o=10'b0000000000;
						read_address = write_address;
					end
				else
					begin
						read_address = 5;
					end
				end

			S5:begin
				write_address=5;
				if (bus_data_i ==10'b11111111111) 
					begin
						bus_data_o=10'b0000000000;
						read_address = write_address;
					end
				else
					begin
						read_address = 4;
					end
				end

			S4:begin
				write_address=4;
				if (bus_data_i ==10'b11111111111) 
					begin
						bus_data_o=10'b0000000000;
						read_address = write_address;
					end
				else
					begin
						read_address = 3;
					end
				end

			S3:begin
				write_address=3;
				if (bus_data_i ==10'b11111111111) 
					begin
						bus_data_o=10'b0000000000;
						read_address = write_address;
					end
				else
					begin
						read_address = 22;
					end
				end				
			
		endcase
	end

endmodule 