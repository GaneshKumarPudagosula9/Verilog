// Code your testbench here
// or browse Examples
module cla_tb;

reg [3:0] a, b;
reg e;

wire [4:0] s;
wire [3:0] c;

wire g3, g2, g1, g0;
wire p3, p2, p1, p0;

integer i;

// DUT instantiation
cla c1(
    .e(e),
    .s(s),
    .c(c),
    .g3(g3),
    .g2(g2),
    .g1(g1),
    .g0(g0),
    .p3(p3),
    .p2(p2),
    .p1(p1),
    .p0(p0),
    .a3(a[3]),
    .a2(a[2]),
    .a1(a[1]),
    .a0(a[0]),
    .b3(b[3]),
    .b2(b[2]),
    .b1(b[1]),
    .b0(b[0])
);

// Testbench
initial
begin
    $monitor("Time=%0t | a=%b | b=%b | cin=%b | Sum=%b | Carry=%b",
                  $time, a, b, e, s, c);

    // Apply all possible input combinations
    for (i = 0; i < 512; i = i + 1)
    begin
        {a, b, e} = i;
        #10;
    end

    $finish;
end

// Waveform generation
initial
begin
    $dumpfile("dump.vcd");
    $dumpvars();
end

endmodule