// Code your testbench here
// or browse Examples
module not_gate_tb();

    // Input declaration
    reg a;

    // Output declaration
    wire b;

    // DUT Instantiation
    not_gate n1 (
        .a(a),
        .b(b)
    );

    // Apply input stimulus
    initial begin

        $monitor("Time=%0t | a=%b | b=%b",
                  $time, a, b);

        a = 1'b0;

        #10 a = 1'b1;
        #10 a = 1'b0;

        #10 $finish;
    end

    // Generate waveform dump
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars();
    end

endmodule