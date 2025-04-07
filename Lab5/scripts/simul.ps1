iverilog -o ./build/wave.out ./src/test_Lamp.v ./src/LampCtrl.v
vvp -n ./build/wave.out