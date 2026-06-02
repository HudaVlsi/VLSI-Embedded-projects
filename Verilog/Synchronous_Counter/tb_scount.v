`timescale 1ns/1ps

module tb_scount;

reg clk;
reg rst;
wire [3:0] count;

scount uut (
    .clk(clk),
    .rst(rst),
    .count(count)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    rst = 1;

    #10 rst = 0;

    #160;

    $stop;
end

endmodule
