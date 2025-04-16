module SR_FlipFlop (
    input wire S, R, C, 
    output wire Q, Qn
);
    wire P, Pn, Cn;
    not n1(Cn, C);
    CSR_Latch L1(.S(S), .R(R), .C(C), .Q(P), .Qn(Pn));
    CSR_Latch L2(.S(P), .R(Pn), .C(Cn), .Q(Q), .Qn(Qn));
endmodule

module D_FlipFlop (
    input wire D, C,
    output wire Q, Qn
);
    wire P, Pn, Cn;
    not n1(Cn, C);
    D_Latch L1(.D(D), .C(C), .Q(P), .Qn(Pn));
    CSR_Latch L2(.S(P), .R(Pn), .C(Cn), .Q(Q), .Qn(Qn));
endmodule

module JK_FlipFlop (
    input wire J, K, C,
    output wire Q, Qn
);
    wire D;
    assign D = (J & Qn) | (~K & Q);
    D_FlipFlop L1(.D(D), .C(C), .Q(Q), .Qn(Qn));
endmodule

module T_FlipFlop (
    input wire T, C,
    output wire Q, Qn
);
    wire D, P, Pn;
    reg reset;

    assign D = P ^ T;
    assign P = Q & reset;
    assign Pn = Qn | ~reset;
    initial begin
        reset = 0;
    end
    always @(posedge Q) begin
        reset = 1;
    end

    D_FlipFlop L1(.D(D), .C(C), .Q(Q), .Qn(Qn));
endmodule