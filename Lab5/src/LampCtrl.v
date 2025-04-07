module LampCtrl (
    S1, S2, S3, F, G, G2A, G2B
);
    input S1, S2, S3, G, G2A, G2B;
    output F;
    wire [7:0] Y;

    decoder_3_8 D(.C(S3), .B(S2), .A(S1), .G(G), .G2A(G2A), .G2B(G2B), .Y(Y));

    nand node(F, Y[1], Y[2], Y[4], Y[7]);
endmodule