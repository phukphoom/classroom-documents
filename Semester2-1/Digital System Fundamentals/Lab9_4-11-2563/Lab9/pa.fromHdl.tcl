
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name Lab9 -dir "C:/Users/Admin/Desktop/CodeHub/ClassDocs/Semester2-1/Digital System Fundamentals/Lab9_4-11-2563/Lab9/planAhead_run_3" -part xc6slx9tqg144-3
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "MainCircuitPin.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {FullAdder.vf}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Mux4To1_4_Bus.vf}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Adder8Bits_Bus.vf}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Xor8Bits_Bus.vf}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Sub8Bits_Bus.vf}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {SHL8Bits_Bus.vf}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Mux4To1_8_Bus.vf}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {HEX27SEG_Bus.vf}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {MainCircuit.vf}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top MainCircuit $srcset
add_files [list {MainCircuitPin.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx9tqg144-3
