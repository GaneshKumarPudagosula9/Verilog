// Code your testbench here
// or browse Examples
module prior_enc_tb;

reg [7:0] i;
wire [2:0] y;

// DUT instantiation
prior_enc p1(
    .i(i),
    .y(y)
);

// Testbench
initial
begin
    $monitor("Time=%0t | Input=%b | Output=%b",
                  $time, i, y);

    // Apply input combinations

    i = 8'b11111111;
    #10 i = 8'b10101010;
    #10 i = 8'b11011010;

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