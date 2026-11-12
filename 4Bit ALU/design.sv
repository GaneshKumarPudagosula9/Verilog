// Code your design here
module alu_4bit (
    input  [3:0] a, b,
    input  [2:0] s,
    input        c, z, o,
    output reg [4:0] y
);

    // ALU Operations
    always @(*) begin
        case (s)

            3'b000: y = a + b;   // Addition
            3'b001: y = a - b;   // Subtraction
            3'b010: y = a & b;   // Bitwise AND
            3'b011: y = a | b;   // Bitwise OR
            3'b100: y = a ^ b;   // Bitwise XOR
            3'b101: y = ~a;      // Bitwise NOT
            3'b110: y = a << 2;  // Left Shift by 2
            3'b111: y = a >> 2;  // Right Shift by 2

            default: y = 5'b00000;

        endcase
    end

endmodule