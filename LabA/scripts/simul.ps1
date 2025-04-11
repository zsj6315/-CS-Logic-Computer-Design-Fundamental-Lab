iverilog -o ./build/wave.out ./src/Latch.v ./src/FlipFlop.v ./src/testbench.v
vvp -n ./build/wave.out
