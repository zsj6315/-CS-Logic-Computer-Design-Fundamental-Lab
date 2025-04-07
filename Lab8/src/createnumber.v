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
    output reg [3 : 0] n0, n1,
    output wire [3 : 0] n2, n3
);

    reg GND;
    initial GND <= 0;

    
    initial begin
        {n1, n0} <= 8'b0001_0010;
    end

    Adder_4b adder_c(.A(n0), .B(n1), .S(n2), .Ci(GND), .Co(n3[0]));
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