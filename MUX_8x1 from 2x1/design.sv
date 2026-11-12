// Code your design here
module mux_2x1(
    input [1:0] a,
    input s,
    output reg y
);

// Multiplexer logic
always @(*)
begin
    y = ((a[0] & (~s)) | (a[1] & s));
end

endmodule

module mux_8x1(
    input [7:0] a,
    input [2:0] s,
    output y
);

wire w1, w2, w3, w4, w5, w6;

// First stage of multiplexing
assign w1 = ((a[0] & (~s[0])) | (a[1] & s[0]));
assign w2 = ((a[2] & (~s[0])) | (a[3] & s[0]));
assign w3 = ((a[4] & (~s[0])) | (a[5] & s[0]));
assign w4 = ((a[6] & (~s[0])) | (a[7] & s[0]));

// Second stage of multiplexing
assign w5 = ((w1 & (~s[1])) | (w2 & s[1]));
assign w6 = ((w3 & (~s[1])) | (w4 & s[1]));

// Third stage of multiplexing
assign y = ((w5 & (~s[2])) | (w6 & s[2]));

endmodule