// Code your testbench here
// or browse Examples
module xor_gate_tb();

    // Input declarations
    reg a, b;

    // Output declaration
    wire c;

    // DUT Instantiation
    xor_gate x1 (
        .a(a),
        .b(b),
        .c(c)
    );

    // Apply input stimulus
    initial begin

    $monitor("Time=%0t | a=%b | b=%b | c=%b",
              $time, a, b, c);

    a = 1'b0; b = 1'b0;
    #15 a = 1'b0; b = 1'b1;
    #15 a = 1'b1; b = 1'b0;
    #15 a = 1'b1; b = 1'b1;
    //#15 a = 1'b0; b = 1'b0;

    #75 $finish;

end

    // Generate waveform dump
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars();
    end

endmodule