`timescale 1ns/1ns

module test_Lamp;
    reg C, B, A, G, G2A, G2B, clk;
    wire F;
    
    initial begin
        C = 0;
        B = 0;
        A = 0;
        G = 1;
        G2A = 0;
        G2B = 0;
        clk = 0;
    end

    always begin
        #50 clk = ~clk;
    end

    always @(posedge clk) begin
        #2 C = {$random} % 2;
        #3 B = {$random} % 2;
        #3 A = {$random} % 2;
    end
    LampCtrl controler(.S3(C), .S2(B), .S1(A), .G(G), .G2A(G2A), .G2B(G2B), .F(F));

    initial begin
        $dumpfile("./build/wave.vcd");
        $dumpvars(0, test_Lamp);
        #10000 $finish;
    end
endmodule