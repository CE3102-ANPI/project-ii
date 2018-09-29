/* 
 *
 * Synchronous counter with enable (we).
 *
 * @file  counterwe.sv
 * @autor Victor Montero
 * @date  20/09/2018
 */

module counterwe #(parameter N = 8)
(
    input logic clk_i, rst_i,e,
    output logic [N-1:0] q_o
);
    always_ff @(posedge clk_i, posedge rst_i)
        if(rst_i) q_o <= 0;
        else if (e)  q_o <= q_o + 1;
		  else q_o=q_o;

endmodule