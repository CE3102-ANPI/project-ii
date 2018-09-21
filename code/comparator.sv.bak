module comparator #(parameter N = 8)
(
	input logic [N–1:0] bus_a_i, bus_b_i,
	output logic eq_o, neq_o, lt_o, lte_o, gt_o, gte_o
);
	assign eq_o  = (bus_a_i == bus_b_i);
	assign neq_o = (bus_a_i != bus_b_i);
	assign lt_o  = (bus_a_i <  bus_b_i);
	assign lte_o = (bus_a_i <= bus_b_i);
	assign gt_o  = (bus_a_i >  bus_b_i);
	assign gte_o = (bus_a_i >= bus_b_i);
endmodule
