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

module create_number (
    input wire clk,
    input wire [1 : 0] btn,
    input wire [1 : 0] op,
    output reg [3 : 0] n0, n1,
    output wire [3 : 0] n2, n3
);

    reg GND;
    initial GND <= 0;

    
    initial begin
        {n1, n0} <= 8'b0001_0010;
    end

    wire [3 : 0] n2_01, n2_23;
    wire n3_01, n3_23;

    Adder_4b adder_c(.A(n0), .B(n1), .S(n2_01), .op(op[0]), .Co(n3_01));
    my_And_Or_4b andor_c(.A(n0), .B(n1), .S(n2_23), .op(op[0]), .Co(n3_23));
    Mux_4_1_b4 Mux41b4_c1(.s(op), .I0(n2_01), .I1(n2_01), .I2(n2_23), .I3(n2_23), .o(n2));
    
    assign n3[0] = (~op[1] & n3_01) | (op[1] & n3_23);
    assign n3[1] = GND;
    assign n3[2] = GND;
    assign n3[3] = GND;

    wire [3 : 0] t0, t1;

    assign t0 = n0 + 1'b1;
    assign t1 = n1 + 1'b1;

    wire [1 : 0] tbtn;

    pbdebounce db0(.clk_1ms(clk), .I(btn[0]), .O(tbtn[0]));
    pbdebounce db1(.clk_1ms(clk), .I(btn[1]), .O(tbtn[1]));
    
    always @(posedge tbtn[0]) n0 <= t0; 
    always @(posedge tbtn[1]) n1 <= t1; 
    
endmodule