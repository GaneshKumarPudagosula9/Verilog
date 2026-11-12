// Code your design here
module decoder_2x4(
    input i1,
    input i0,
    input e,
    output reg y0,
    output reg y1,
    output reg y2,
    output reg y3
);

// Decoder logic
always @(*)
begin
    y0 = (e & (~i1 & ~i0));
    y1 = (e & (~i1 &  i0));
    y2 = (e & ( i1 & ~i0));
    y3 = (e & ( i1 &  i0));
end

endmodule
             