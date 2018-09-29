/* 
 *
 * Comparator with equal, not equal,
 * less than, less or equal, greater than
 * greater or equal.
 *
 * @file  comparator.sv
 * @autor Luis Arturo Mora Granados
 * @date  20/09/2018
*/

module comparator #(parameter BITS = 8) 
(
   input  logic [BITS-1:0] a, b,
   output logic eq, neq, lt, lte, gt, gte
);

	always_comb begin
		eq  = (a == b);
		neq = (a != b);
		lt  = (a < b);
		lte = (a <= b);
		gt  = (a > b);
		gte = (a >= b);
	end
	
endmodule
