module clkdiv (
    input wire clk, rst,
    output reg [31 : 0] clkdiv,
    output reg clk_1s
);

    initial begin
        clkdiv <= 0;
    end
    
    always @(posedge clk or posedge rst) begin
        if(rst) clkdiv <= 0;
        else clkdiv <= clkdiv + 1'b1;
    end

    reg [31 : 0] cnt;
    initial begin
        cnt = 0;
        clk_1s = 0;
    end
    always @(posedge clk) begin
        if(cnt < 2_500_000) begin
            cnt <= cnt + 1;
        end
        else begin
            cnt = 0;
            clk_1s = ~clk_1s;
        end
    end
endmodule