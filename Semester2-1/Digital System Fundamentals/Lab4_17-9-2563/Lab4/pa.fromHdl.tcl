
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name Lab4 -dir "C:/Users/Admin/Desktop/CodeHub/ClassDocs/Semester2-1/Digital System Fundamentals/Lab4_17-9-2563/Lab4/planAhead_run_5" -part xc6slx9tqg144-3
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "MainLogicPin.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {MainLogic.vf}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top MainLogic $srcset
add_files [list {MainLogicPin.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx9tqg144-3
