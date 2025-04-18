`timescale 1ns/1ns
module tb_Latch;

reg clk;
reg D, S, R, C;
wire Q, Qn;

always begin
    #50 clk = ~clk;
end

always begin
    #500 C = ~C;
end

initial begin
    $dumpfile("./build/Dflipflop.vcd");
    $dumpvars(0, tb_Latch);
    #90000 $finish;
end

initial begin
    clk = 0;
    D = 1;
    S = 1;
    R = 0;
    C = 0;
end

// SR_FlipFlop UUT(.S(S), .R(R), .C(C), .Q(Q), .Qn(Qn));
D_FlipFlop UUT(.D(D), .C(C), .Q(Q), .Qn(Qn));
// D_Latch UUT(.C(C), .D(D), .Q(Q), .Qn(Qn));
// This place choose which to test

always @(posedge clk) begin
    #1 D = {$random};
    #3 S = {$random};
    #3 R = {$random};
end
endmodule