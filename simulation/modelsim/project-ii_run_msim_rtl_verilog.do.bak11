transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/artmo/Documents/Workspace/project-ii/src {C:/Users/artmo/Documents/Workspace/project-ii/src/pll.sv}
vlog -sv -work work +incdir+C:/Users/artmo/Documents/Workspace/project-ii/src {C:/Users/artmo/Documents/Workspace/project-ii/src/fsm_vga.sv}
vlog -sv -work work +incdir+C:/Users/artmo/Documents/Workspace/project-ii/src {C:/Users/artmo/Documents/Workspace/project-ii/src/counter.sv}
vlog -sv -work work +incdir+C:/Users/artmo/Documents/Workspace/project-ii/src {C:/Users/artmo/Documents/Workspace/project-ii/src/vga_controller.sv}
vlog -sv -work work +incdir+C:/Users/artmo/Documents/Workspace/project-ii/testbench {C:/Users/artmo/Documents/Workspace/project-ii/testbench/vga_controller_tb.sv}

