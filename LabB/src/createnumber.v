module pbdebounce (
    input wire clk_1ms,
    input wire I,
    output reg O
);
    reg [7 : 0] pbshift;
    initial begin
        O = 0;
    end
    always @(posedge clk_1ms) begin
        pbshift = pbshift << 1;
        pbshift[0] = I;
        if(pbshift == 8'h00) O = 0;
        if(pbshift == 8'hFF) O = 1;
    end
endmodule

module Dflipflop_4b (
    input wire [3 : 0] D,
    input wire C,
    output wire [3 : 0] Q
);
    wire [3 : 0] Qn;
    D_FlipFlop D0(.D(D[0]), .C(C), .Q(Q[0]), .Qn(Qn[0]));
    D_FlipFlop D1(.D(D[1]), .C(C), .Q(Q[1]), .Qn(Qn[1]));
    D_FlipFlop D2(.D(D[2]), .C(C), .Q(Q[2]), .Qn(Qn[2]));
    D_FlipFlop D3(.D(D[3]), .C(C), .Q(Q[3]), .Qn(Qn[3]));
    
endmodule

module create_number (
    input wire clk,
    input wire s,
    input wire clk_1s,
    output wire [3 : 0] n0, n1, n2, n3
);

    reg GND;
    initial GND <= 0;

    reg [3 : 0] m0, m1, m2, m3;
    wire [3 : 0] _1, c1, c2, c3;
    wire [3 : 0] tn0, tn1, tn2, tn3;
    wire r;
    reg [3 : 0] init_clk;
    assign _1 = 4'b0001;
    assign c1[3 : 1] = 3'b000;
    assign c2[3 : 1] = 3'b000;
    assign c3[3 : 1] = 3'b000;

    Adder_4b A0(.op(s), .B(_1), .A(m0), .S(n0), .Co(c1[0]));
    Adder_4b A1(.op(s), .B(c1), .A(m1), .S(n1), .Co(c2[0]));
    Adder_4b A2(.op(s), .B(c2), .A(m2), .S(n2), .Co(c3[0]));
    Adder_4b A3(.op(s), .B(c3), .A(m3), .S(n3), .Co(r));
    

    initial begin
        init_clk = 4'b0000;
    end
    always @(posedge clk) begin
        init_clk = 4'b1111;
    end

    // assign tn0 = n0 & init_clk;
    // assign tn1 = n1 & init_clk;
    // assign tn2 = n2 & init_clk;
    // assign tn3 = n3 & init_clk;

    // Dflipflop_4b D0(.D(tn0), .C(clk_1s), .Q(m0));
    // Dflipflop_4b D1(.D(tn1), .C(clk_1s), .Q(m1));
    // Dflipflop_4b D2(.D(tn2), .C(clk_1s), .Q(m2));
    // Dflipflop_4b D3(.D(tn3), .C(clk_1s), .Q(m3));


    initial begin
        m0 = 0;
        m1 = 0;
        m2 = 0;
        m3 = 0;
    end
    always @(posedge clk_1s) begin
        m0 <= n0;
        m1 <= n1;
        m2 <= n2;
        m3 <= n3;
    end
    
endmodule