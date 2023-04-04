onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ALU_tb/a
add wave -noupdate /ALU_tb/b
add wave -noupdate /ALU_tb/operation
add wave -noupdate /ALU_tb/result
add wave -noupdate /ALU_tb/carryOut
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {39 ps} 0} {{Cursor 2} {79 ps} 0} {{Cursor 3} {119 ps} 0} {{Cursor 4} {159 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {210 ps}
