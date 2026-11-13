// Code your design here
module dff_pre_clr (
    input  d,
    input  rst,
    input  clk,
    input  pre,
    input  clr,
    output reg q
);

    // Synchronous Reset, Preset and Clear D Flip-Flop
    always @(posedge clk) begin

        if (rst || clr)
            q <= 1'b0;  // Reset or Clear output

        else if (pre)
            q <= 1'b1;  // Preset output

        else
            q <= d;     // Capture input data

    end

endmodule