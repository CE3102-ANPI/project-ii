/* 
 *
 * Synchronous Reset Counter.
 *
 * @file  counter.sv
 * @autor Luis Arturo Mora Granados
 * @date  21/09/2018
 */

module counter #(parameter BITS = 4)
(
	input logic clk_i, rst_i, ena_i,
	output logic [BITS-1:0] bus_q_o
);
	always_ff @(posedge clk_i)
		if     (rst_i) bus_q_o <= 0;
		else if(ena_i) bus_q_o <= bus_q_o + 1'b1;
endmodule
