// File: stack.v
module stack #(
    parameter WIDTH = 8,    // bits per element
    parameter DEPTH = 16    // stack size
)(
    input clk,
    input reset,
    input [1:0] instruction, // 00 = push, 01 = pop, 10 = peek
    input [WIDTH-1:0] data_in,
    output reg [WIDTH-1:0] data_out,
    output reg empty,
    output reg full
);

    reg [WIDTH-1:0] mem [0:DEPTH-1];
    reg [$clog2(DEPTH):0] sp; // stack pointer

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            sp <= 0;
            empty <= 1;
            full <= 0;
            data_out <= 0;
        end else begin
            case (instruction)
                2'b00: begin // PUSH
                    if (!full) begin
                        mem[sp] <= data_in;
                        sp <= sp + 1;
                        empty <= 0;
                        if (sp + 1 == DEPTH) full <= 1;
                    end
                end
                2'b01: begin // POP
                    if (!empty) begin
                        sp <= sp - 1;
                        data_out <= mem[sp - 1];
                        full <= 0;
                        if (sp - 1 == 0) empty <= 1;
                    end
                end
                2'b10: begin // PEEK
                    if (!empty) data_out <= mem[sp - 1];
                end
            endcase
        end
    end
endmodule
