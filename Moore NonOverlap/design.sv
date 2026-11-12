// Code your design here

module moore_nonoverlap(
    input clk,
    input rst,
    input din,
    output reg dout
);

  reg [2:0] ps, ns;

parameter S0 = 3'b000,
          S1 = 3'b001,
          S2 = 3'b010,
          S3 = 3'b011,
          S4 = 3'b100;

// State register
always @(posedge clk)
begin
    if (rst)
        ps <= S0;
    else
        ps <= ns;
end

// Next state logic
always @(*)
begin
    case(ps)

        S0: if (din)
                ns = S1;
            else
                ns = S0;

        S1: if (din)
                ns = S1;
            else
                ns = S2;

        S2: if (din)
                ns = S3;
            else
                ns = S0;

        S3: if (din)
                ns = S4;
            else
                ns = S2;

        // Non-overlapping transition
        S4: ns = S0;

        default: ns = S0;

    endcase
end

// Moore output logic
always @(*)
begin
    if (ps == S4)
        dout = 1'b1;
    else
        dout = 1'b0;
end

endmodule
