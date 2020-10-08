
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name Lab5 -dir "C:/Users/Admin/Desktop/CodeHub/ClassDocs/Semester2-1/Digital System Fundamentals/Lab5_8-10-2563/Lab5/planAhead_run_5" -part xc6slx9tqg144-3
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "AddPin.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {JK_CouterUp1_6.vf}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top JK_CouterUp1_6 $srcset
add_files [list {AddPin.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx9tqg144-3
