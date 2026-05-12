module fsm(
    input logic clk,
    input logic rst,
    input logic x,
    output logic y
);

typedef enum logic [2:0] {
    S0, S1, S2, S3, S4
} state_t;

state_t present_state, next_state;

always_ff @(posedge clk or posedge rst) begin
    if (rst)
        present_state <= S0;
    else
        present_state <= next_state;
end

always_comb begin

    next_state = present_state;
    y = 0;

    case(present_state)

        S0: begin
            if(x)
                next_state = S1;
        end

        S1: begin
            if(~x)
                next_state = S2;
        end

        S2: begin
            if(x)
                next_state = S3;
            else
                next_state = S0;
        end

        S3: begin
            if(x) begin
                next_state = S4;
                y = 1;
            end
            else
                next_state = S2;
        end

        S4: begin
            next_state = S0;
        end

    endcase

end

endmodule