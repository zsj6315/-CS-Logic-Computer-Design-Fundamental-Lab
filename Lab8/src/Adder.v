module Adder_1b (
    input wire Ci, A, B,
    output wire S, Co
);
    
    assign Co = (A & B) | (A & Ci) | (Ci & B);
    assign S = A ^ B ^ Ci;

endmodule

module Adder_4b (
    input wire Ci,
    input wire [3 : 0] A, B,
    output wire Co,
    output wire [3 : 0] S
);
    
    wire [3 : 1] C;

    Adder_1b
        A0(.Ci(Ci), .A(A[0]), .B(B[0]), .S(S[0]), .Co(C[1])),
        A1(.Ci(C[1]), .A(A[1]), .B(B[1]), .S(S[1]), .Co(C[2])),
        A2(.Ci(C[2]), .A(A[2]), .B(B[2]), .S(S[2]), .Co(C[3])),
        A3(.Ci(C[3]), .A(A[3]), .B(B[3]), .S(S[3]), .Co(Co));


endmodule