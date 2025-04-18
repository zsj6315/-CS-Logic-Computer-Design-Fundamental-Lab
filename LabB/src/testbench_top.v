`timescale 1ns/1ns

module uut;
    reg s;
    reg [7 : 0] SW;
    reg clk;

    wire [3 : 0] AN;
    wire [7 : 0] SEGMENT;
    wire BTNX4;
    wire Ring;

    initial begin
        SW = 8'hFF;
        clk = 0;
        s = 1;
    end

    top uut0(.s(s), .clk(clk), .SW(SW), .AN(AN), .SEGMENT(SEGMENT), .BTNX4(BTNX4), .Ring(Ring));

    always begin
        #5 clk = ~clk;
    end

    initial begin
        #50000 s = 1;
    end

    initial begin
        $dumpfile(".\\build\\wave.vcd");
        $dumpvars(0, uut);
        #1000000 $finish;
    end
    
endmodule