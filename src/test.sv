
module test(clk, rst, x, y);
input clk, rst, x;
output logic [1:0] y;
typedef enum logic [1:0] { STATEA, STATEB, STATEC,STATED } statetype;
statetype state, next_state;
// next state logic
always_comb begin
case(state)
STATEA: next_state = x ? STATEB : STATEA;
STATEB: next_state = x ? STATEC : STATED;
STATEC: next_state = x ? STATED : STATEA;
STATED: next_state = x ? STATEC : STATEB;
endcase
end

always_ff @(posedge clk) begin
if (rst)
state <= STATEA;
else
state <= next_state;
end
// Output logic
always_comb begin
case(state)
STATEA: if (x) begin
			y = 2'b00;
			end
STATEB: y = 2'b00;
STATEC: y = 2'b11;
STATED: y = 2'b10;
endcase
end
endmodule
