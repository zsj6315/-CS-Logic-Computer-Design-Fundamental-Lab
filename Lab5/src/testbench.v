`timescale 1ns/1ns

module testbench;
    reg C, B, A, G, G2A, G2B, clk;
    wire [7:0] Y;
    
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
        #1 C = {$random} % 2;
        #3 B = {$random} % 2;
        #3 A = {$random} % 2;
    end
    decoder_3_8 Decoder(.C(C), .B(B), .A(A), .G(G), .G2A(G2A), .G2B(G2B), .Y(Y));

    initial begin
        $dumpfile("./build/wave.vcd");
        $dumpvars(0, testbench);
        #10000 $finish;
    end
endmodule