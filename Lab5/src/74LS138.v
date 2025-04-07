module decoder_3_8 (
    C, B, A, G, G2A, G2B, Y
);
    input wire C, B, A, G, G2A, G2B;
    output wire [7:0] Y;

    not node_0_0(A_n, A);
    not node_0_1(B_n, B);
    not node_0_2(C_n, C);
    not node_0_3(G_n, G);
    
    and node_1_0(D0, A_n, B_n);
    and node_1_1(D1, A, B_n);
    and node_1_2(D2, A_n, B);
    and node_1_3(D3, A, B);
    nor node_1_4(EN, G_n, G2A, G2B);

    nand node_2_0(Y[0], EN, D0, C_n);
    nand node_2_1(Y[1], EN, D1, C_n);
    nand node_2_2(Y[2], EN, D2, C_n);
    nand node_2_3(Y[3], EN, D3, C_n);
    nand node_2_4(Y[4], EN, D0, C);
    nand node_2_5(Y[5], EN, D1, C);
    nand node_2_6(Y[6], EN, D2, C);
    nand node_2_7(Y[7], EN, D3, C);
    
endmodule