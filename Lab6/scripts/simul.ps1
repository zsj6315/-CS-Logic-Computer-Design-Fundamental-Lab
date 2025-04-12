iverilog -o ./build/wave.out ./src/MyMC14495.v ./src/testbench.v
vvp -n ./build/wave.out
