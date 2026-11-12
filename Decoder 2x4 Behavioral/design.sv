// Code your design here
module decoder_2x4(
    input wire [1:0] i,
    input e,
    output reg [3:0] y
);

// Decoder logic
always @(*)
begin
    if (e == 1'b1)
    begin
        case(i)

            2'b00: y = 4'b0000;
            2'b01: y = 4'b0010;
            2'b10: y = 4'b0100;
            2'b11: y = 4'b1000;

            default: y = 4'b0000;

        endcase
    end
    else
        y = 4'b0000;
end

endmodule