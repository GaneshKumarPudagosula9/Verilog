// Code your testbench here
// or browse Examples
module nand_gate_tb;

reg a, b;
wire c;

nand_gate n1(
    .a(a),
    .b(b),
    .c(c)
);

// Testbench
initial
begin
    $monitor("Time=%0t | a=%b | b=%b | c=%b",
                  $time, a, b, c);

    a = 1'b0;
    b = 1'b0;

    // Input combinations

    #10 a = 1'b1;
    #10 b = 1'b1;
    #10 a = 1'b0;
    #10 b = 1'b0;

    #10;
    $finish;
end

initial
begin
    $dumpfile("dump.vcd");
    $dumpvars();
end

endmodule