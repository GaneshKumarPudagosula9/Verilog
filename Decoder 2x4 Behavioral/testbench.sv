// Code your testbench here
// or browse Examples
module decoder_2x4_tb;

reg [1:0] i;
reg e;
wire [3:0] y;
integer j;

// DUT instantiation
decoder_2x4 d1(
    .i(i),
    .e(e),
    .y(y)
);

// Testbench
initial
begin
    $monitor("Time=%0t | e=%b | i=%b | y=%b",
                  $time, e, i, y);

    // Apply all possible input combinations
    for (j = 0; j < 8; j = j + 1)
    begin
        {e, i} = j;
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