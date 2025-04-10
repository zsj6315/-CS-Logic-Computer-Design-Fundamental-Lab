module LampCtrl (
    S1, S2, S3, F, G, G2A, G2B
);
    input S1, S2, S3, G, G2A, G2B;
    output F;
    wire [7:0] Y;

    decoder_3_8 D(.C(S3), .B(S2), .A(S1), .G(G), .G2A(G2A), .G2B(G2B), .Y(Y));

    nand node(F, Y[1], Y[2], Y[4], Y[7]);
endmodule

module controller (
    input wire S1, S2, S3, S4, S5, S6, 
    output wire [7 : 0] LED
);
    LampCtrl L1(.S1(S1), .S2(S2), .S3(S3), .G(S4), .G2A(S5), .G2B(S6), .F(LED[7]));
    assign LED[6 : 0] = 7'b0000000;
endmodule