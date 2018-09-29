 /* 
  *
  * Mux 2 to 1
  *
  * @file  mux2.sv
  * @autor Victor Montero
  * @date  20/09/2018
  */

module mux4(input logic [3:0] d0, d1, d2, d3,
				input logic [1:0] s,
				output logic [3:0] y);
	logic [3:0] low, high;
	mux2 lowmux(d0, d1, s[0], low);
	mux2 highmux(d2, d3, s[0], high);
	mux2 finalmux(low, high, s[1], y);
endmodule