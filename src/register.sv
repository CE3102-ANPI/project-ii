/* 
 *
 * Asynchronous reset register.
 *
 * @file  register.sv
 * @autor Luis Arturo Mora Granados
 * @date  21/09/2018
 */

module register #(parameter BITS = 4)
(
	input logic clk_i, rst_i, ena_i,
	input logic [BITS-1:0] bus_d_i,
	output logic [BITS-1:0] bus_q_o
);
	always_ff @(posedge clk_i, posedge rst_i)
		if(rst_i)      bus_q_o <= 0;
		else if(ena_i) bus_q_o <= bus_d_i;
endmodule
