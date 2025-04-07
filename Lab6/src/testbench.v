`timescale 1ns/1ns

module tb_MyMC14495;

integer i;

reg D7, D6, D5, D4, D3, D2, D1, D0, LE, point;
wire a, b, c, d, e, f, g, p;

initial begin
    D3 = 0;
    D2 = 0;
    D1 = 0;
    D0 = 0;
    LE = 0;
    point = 0;
end

controller test_MyMC14495(.SW({D7, D6, D5, D4, D3, D2, D1, D0}), .BTN({point, LE}), 
.SEGMENT({p, g, f, e, d, c, b, a}));

initial begin
    for(i = 0; i <= 15; i = i + 1) begin
        #50;
        {D3, D2, D1, D0} = i;
        point = i;
    end
    #50;
    LE = 1;
end

initial begin
    $dumpfile("tb_MyMC14495.vcd");
    $dumpvars(0, tb_MyMC14495);
    #1000 $finish;
end
    
endmodule