module SR_Latch (
    input wire S, R,
    output wire Q, Qn
);
    nand n1(Q, S, Qn);
    nand n2(Qn, R, Q);
endmodule

module CSR_Latch (
    input wire S, R, C,
    output wire Q, Qn
);
    nand n1(S1, S, C);
    nand n2(R1, R, C);
    nand n3(Q, S1, Qn);
    nand n4(Qn, R1, Q);
endmodule

module D_Latch (
    input wire D, C,
    output wire Q, Qn
);
    wire Dn;
    not n1(Dn, D);
    CSR_Latch L1(.S(D), .R(Dn), .C(C), .Q(Q), .Qn(Qn));
endmodule
