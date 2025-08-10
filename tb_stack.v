// File: tb_stack.v
module tb_stack;
    reg clk;
    reg reset;
    reg [1:0] instruction;
    reg [7:0] data_in;
    wire [7:0] data_out;
    wire empty, full;

    stack uut (
        .clk(clk),
        .reset(reset),
        .instruction(instruction),
        .data_in(data_in),
        .data_out(data_out),
        .empty(empty),
        .full(full)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; // clock every 5 time units
    end

    initial begin
        $display("Starting test...");

        reset = 1; #10; reset = 0;

        // PUSH 10
        instruction = 2'b00; data_in = 8'd10; #10;
        // PUSH 20
        instruction = 2'b00; data_in = 8'd20; #10;
        // PEEK
        instruction = 2'b10; #10;
        $display("Peek: %d", data_out);
        // POP
        instruction = 2'b01; #10;
        $display("Pop: %d", data_out);

        $finish;
    end
endmodule
