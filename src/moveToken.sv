 /* 
  *
  * Token generation fsm.
  *
  * @file  move_token.sv
  * @autor Victor Montero
  * @date  29/09/2018
  */
/*module move_token
	(
	input logic clk, reset,start,
	input logic [1:0] tokID,dir,//tipo ficha que se mueve,direccion de movimiento
	input logic [9:0] bus_data_in,
	output logic [4:0] address_write,address_read,
	output logic [9:0] bus_data_o,
	output logic busy
	);
	
	typedef enum logic [3:0] {S0, S1, S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12} statetype;
	statetype state, nextstate;

	logic [3:0] tok1_pos [7:0];
	logic [3:0] tok2_pos [7:0];
	logic [3:0] tok3_pos [7:0];
	logic [3:0] tok4_pos [7:0];
	logic [3:0] i1,j1,i2,j2,i3,j3,i4,j4;// current token position
	
	assign tok1_pos='{1,4,1,5,2,4,2,5};
	assign tok2_pos='{0,5,1,5,2,4,2,5};
	assign tok3_pos='{1,5,2,4,2,5,2,6};
	assign tok4_pos='{0,5,1,5,1,4,2,4};
	
	// state register
	always_ff @(posedge clk, posedge reset)
		if (reset) state <= S0;
		else       state <= nextstate;
	
	always_comb begin//maquina de estados, en cada conjunto de 4 estados se realiza una parte del movimiento de la ficha
		case (state)
			S0:	if (start) 
						nextstate=S0;
					else
						nextstate=S1;
			
			S1:	nextstate = S2;//inicio borrar ficha de ram
					
			S2:	nextstate = S3;
			
			S3:	nextstate = S4;
			
			S4:	nextstate = S5;//fin borrar ficha
			
			S5:	nextstate = S6; //inicio leer pos +-1
			
			S6:	nextstate = S7;
			
			S7:	nextstate = S8;
			
			S8:	nextstate = S9;//fin leer pos
			
			S9:	nextstate = S10;//inicio escribir pos 
			
			S10:	nextstate = S11;
			
			S11:	nextstate = S12;
			
			S12:	nextstate = S0; //fin escribir pos
		endcase
	end

	
		
		
	output logic
	assign busy=(state!=S0);
	
	always_latch begin
		case (state) 
		S1:
			begin
				 
			end*/
	
	