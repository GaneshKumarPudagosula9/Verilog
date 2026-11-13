// Code your design here
module dff_syn (
    input  d,
    input  rst,
    input  clk,
    output reg q
);

    // Synchronous Reset D Flip-Flop
    always @(posedge clk) begin

        if (rst)
            q <= 1'b0;  // Reset output to zero

        else
            q <= d;     // Capture input data

    end

endmodule