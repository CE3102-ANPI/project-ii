 /* 
  *
  * Token generation logic.
  *
  * @file  genToken.sv
  * @autor Victor Montero
  * @date  21/09/2018
  */
  
module genToken
  (
	input logic clk,rst,
	
	output logic [4:0] addr_ram_board,
	output logic [9:0] bus_data_o_ram_board
  );
  logic [1:0] tok_list [15:0];
  logic [3:0]cnt_tok_out;//numero retornado por el contador que decide la ficha que se pinta
  logic [1:0]tok_id;//identificador del token a pintar
  logic count_enable;
	
  counterwe #(4) tokListCount(clk,rst,count_enable,cnt_tok_out);
  putToken putToken1(clk,rst,tok_id,addr_ram_board,bus_data_o_ram_board);
	
	assign tok_list ='{0,1,2,3,
					1,0,3,2,
					2,3,1,0,
					0,2,1,3};
	assign tok_id=tok_list[cnt_tok_out];
	
	
  
endmodule