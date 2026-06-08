`timescale 1ns/1ps

module fifo_tb;

    reg clk;
    reg rst;

    reg wr_en;
    reg rd_en;

    reg [7:0] data_in;

    wire [7:0] data_out;
    wire full;
    wire empty;

    fifo DUT (
        .clk(clk),
        .rst(rst),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .data_in(data_in),
        .data_out(data_out),
        .full(full),
        .empty(empty)
    );

    // Clock Generation
    always #5 clk = ~clk;

    initial
    begin

        clk = 0;
        rst = 1;
        wr_en = 0;
        rd_en = 0;
        data_in = 0;

        #20;
        rst = 0;

        // Write Data

        @(posedge clk);
        wr_en = 1;
        data_in = 8'h11;

        @(posedge clk);
        data_in = 8'h22;

        @(posedge clk);
        data_in = 8'h33;

        @(posedge clk);
        wr_en = 0;

        // Read Data

        @(posedge clk);
        rd_en = 1;

        @(posedge clk);

        @(posedge clk);

        @(posedge clk);
        rd_en = 0;

        #50;

        $finish;

    end

    initial
    begin
        $monitor(
            "Time=%0t wr_en=%b rd_en=%b data_in=%h data_out=%h count=%0d full=%b empty=%b",
            $time,
            wr_en,
            rd_en,
            data_in,
            data_out,
            DUT.count,
            full,
            empty
        );
    end

endmodule
