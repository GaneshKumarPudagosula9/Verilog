// Code your testbench here
// or browse Examples
module fa_tb;

reg a, b, cin;
wire s, cout;
integer i;

fa f1(
    .a(a),
    .b(b),
    .cin(cin),
    .s(s),
    .cout(cout)
);

// Testbench
initial
begin
    $monitor("Time=%0t | a=%b | b=%b | cin=%b | Sum=%b | Carry=%b",
                  $time, a, b, cin, s, cout);

    // Apply all possible input combinations
    for (i = 0; i < 8; i = i + 1)
    begin
        {a, b, cin} = i;
        #10;
    end

    $finish;
end

initial
begin
    $dumpfile("dump.vcd");
    $dumpvars();
end

endmodule
  