// Code your testbench here
// or browse Examples
module mux_8x1_tb;

reg [7:0] a;
reg [2:0] s;
wire y;

// DUT instantiation
mux_8x1 m1(
    .a(a),
    .s(s),
    .y(y)
);

// Testbench
initial
begin
    $monitor("Time=%0t | a=%b | s=%b | y=%b",
                  $time, a, s, y);

    // Initialize data input
    a = 8'b10101110;
    s = 3'b000;

    // Apply all select combinations

    #10 s = 3'b001;
    #10 s = 3'b010;
    #10 s = 3'b011;
    #10 s = 3'b100;
    #10 s = 3'b101;
    #10 s = 3'b110;
    #10 s = 3'b111;

    #10;
    $finish;
end

// Waveform generation
initial
begin
    $dumpfile("dump.vcd");
    $dumpvars();
end

endmodule
  