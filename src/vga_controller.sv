 /* 
  *
  * VGA Controller
  *
  * @file  vga_controller.sv
  * @autor Luis Arturo Mora Granados
  * @date  21/09/2018
  */

module vga_controller
(
	input logic clk_i, rst_i,
	input logic [19:0] bus_i,
	output logic hs_o, vs_o, blank_o, sync_o,
	output logic [9:0] addr_o,
	output logic [7:0] r_o, g_o, b_o
);
	logic h_rst, v_rst, h_ena, v_ena, d_ena;
	logic [9:0] h_cnt, v_cnt;
	logic pxl_clk;
	fsm_vga fsm(pxl_clk, rst_i, h_cnt, v_cnt, 
	            d_ena, hs_o, vs_o, h_rst, v_rst, h_ena, v_ena);
	pll#(1) pxl_gen(clk_i, rst_i, 1'b1, pxl_clk);
	counter#(10) h_pixel_cnt(pxl_clk, h_rst, h_ena, h_cnt);
	counter#(10) v_pixel_cnt(pxl_clk, v_rst, v_ena, v_cnt);
	
	assign blank_o = 0;
	assign sync_o  = 0;
	assign r_o = 10200;
	assign g_o = 100;
	assign b_o = 120;
	
endmodule
