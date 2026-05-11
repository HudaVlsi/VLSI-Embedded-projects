module tb_alu;

    reg [3:0] a;
    reg [3:0] b;
    reg [1:0] sel;
    wire [3:0] y;

    alu uut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );

    initial begin

        a = 4'b0011;
        b = 4'b0001;

        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;

        $finish;

    end

endmodule
