// Code your testbench here
// or browse Examples
module decoder_2x4_tb;

reg i1, i0, e;
wire y0, y1, y2, y3;
integer i;

// DUT instantiation
decoder_2x4 d1(
    .i1(i1),
    .i0(i0),
    .e(e),
    .y0(y0),
    .y1(y1),
    .y2(y2),
    .y3(y3)
);

// Testbench
initial
begin
    $monitor("Time=%0t | e=%b | i1=%b | i0=%b | y0=%b | y1=%b | y2=%b | y3=%b",
                  $time, e, i1, i0, y0, y1, y2, y3);

    // Apply all possible input combinations
    for (i = 0; i < 8; i = i + 1)
    begin
        {e, i1, i0} = i;
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