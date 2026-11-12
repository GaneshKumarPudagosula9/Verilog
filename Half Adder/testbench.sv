// Code your testbench here
// or browse Examples
module ha_tb;

reg a, b;
wire s, c;

ha h1(
    .s(s),
    .c(c),
    .a(a),
    .b(b)
);

// Testbench
initial
begin
    $monitor("Time=%0t | a=%b | b=%b | Sum=%b | Carry=%b",
                  $time, a, b, s, c);

    a = 1'b1;
    b = 1'b1;

    // Input combinations

    #10 a = 1'b0;
    #10 b = 1'b0;
    #10 a = 1'b1;
    #10 b = 1'b1;

    #10;
    $finish;
end

initial
begin
    $dumpfile("dump.vcd");
    $dumpvars();
end

endmodule
