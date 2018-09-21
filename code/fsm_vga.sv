module fsm_vga
(
	input logic clk, reset,
	input logic a,
	output logic y
);
	typedef enum logic [1:0] {S0, S1, S2, S3} statetype;
	statetype state, nextstate;
	// state register
	always_ff @(posedge clk, posedge reset)
		if (reset) state <= S0;
		else       state <= nextstate;
	// next state logic
	always_comb
		case (state)
			S0: if (a) nextstate = S1;
				else   nextstate = S0;
			S1: if (a) nextstate = S2;
				else   nextstate = S1;
			S2: if (a) nextstate = S3;
				else   nextstate = S2;
			S3: if (a) nextstate = S0;
				else   nextstate = S1;
			default:   nextstate = S0;
	endcase
endmodule
