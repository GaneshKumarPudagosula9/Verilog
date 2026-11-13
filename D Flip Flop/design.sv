// Code your design here
module dff (
    input  d,
    input  clk,
    output reg q
);

    // Positive Edge Triggered D Flip-Flop
    always @(posedge clk) begin
        q <= d;
    end

endmodule