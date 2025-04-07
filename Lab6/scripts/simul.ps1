iverilog -o wave.out MyMC14495.v testbench.v
vvp -n wave.out
