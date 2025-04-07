iverilog -o .\build\wave.out .\src\LampCtrl.v .\src\LampCtrl_sim.v
vvp -n .\build\wave.out