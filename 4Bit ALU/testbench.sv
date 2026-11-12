// Code your testbench here
// or browse Examples
module alu_4bit_tb();

    // Input declarations
    reg [3:0] a, b;
    reg [2:0] s;
    reg c, z, o;

    // Output declaration
    wire [4:0] y;

    // DUT Instantiation
    alu_4bit a1 (
        .a(a),
        .b(b),
        .s(s),
        .c(c),
        .z(z),
        .o(o),
        .y(y)
    );

    // Apply input stimulus
    initial begin

        a = 4'b1001;
        b = 4'b0011;
        c = 0;
        z = 0;
        o = 0;

        $monitor("Time=%0t | a=%b | b=%b | s=%b | y=%b",
                  $time, a, b, s, y);

        s = 3'b000;  // Addition
        #10 s = 3'b001;  // Subtraction
        #10 s = 3'b010;  // AND
        #10 s = 3'b011;  // OR
        #10 s = 3'b100;  // XOR
        #10 s = 3'b101;  // NOT
        #10 s = 3'b110;  // Left Shift
        #10 s = 3'b111;  // Right Shift

        #10 $finish;
    end

    // Generate waveform dump
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars();
    end

endmodule