 /* 
  *
  * Token generation fsm.
  *
  * @file  putToken.sv
  * @autor Victor Montero
  * @date  21/09/2018
  */
  
module putToken
  (
	input logic clk, reset,start,
	input logic [1:0] tokID,//numero de ficha por generar
	
	output logic [4:0] address,
	output logic [9:0] bus_data_o,
	output logic busy
  );
  
	typedef enum logic [1:0] {S0, S1, S2,S3} statetype;
	statetype state, nextstate;
	// state register
	always_ff @(posedge clk, posedge reset)
		if (reset) state <= S3;
		else       state <= nextstate;
	// next state logic
	always_comb begin//maquina de estados, en cada estado se pinta una linea de la ficha en la matriz
		case (state)
			S3:	if (start) 
						nextstate=S0;
					else
						nextstate=S3;
			
			S0:	nextstate = S1;
			
			S1:	nextstate = S2;
					
			S2:	nextstate = S3;
		endcase
	end
	
	//output logic
	
	assign busy=(state!=S3);
	
	always_latch begin
		case (state) 
			S0:begin
				address=0;
				if (tokID ==2'b00) 
					begin
						bus_data_o=10'b0000000000;
						
					end
				else if (tokID ==2'b01) 
					begin
						bus_data_o=10'b0000100000;
					end
				else if (tokID ==2'b10) 
					begin
						bus_data_o=10'b0000000000;
					end
				else if (tokID ==2'b11) 
					begin               
						bus_data_o=10'b0000100000;
					end
				end
			
			S1:begin
				address=1;
				if (tokID ==2'b00) 
					begin
						bus_data_o=10'b0000110000;
					end
				else if (tokID ==2'b01) 
					begin
						bus_data_o=10'b0000100000;
					end
				else if (tokID ==2'b10) 
					begin
						bus_data_o=10'b0000100000;
					end
				else if (tokID ==2'b11) 
					begin
						bus_data_o=10'b0000110000;
					end
			end

					
			S2:begin
				address=2;
				if (tokID ==2'b00) 
					begin
						bus_data_o=10'b0000110000;
					end
				else if (tokID ==2'b01) 
					begin
						bus_data_o=10'b0000110000;
					end
				else if (tokID ==2'b10) 
					begin             
						bus_data_o=10'b0001110000;
					end
				else if (tokID ==2'b11) 
					begin
						bus_data_o=10'b0000010000;
					end
				end
		endcase
	end

endmodule 