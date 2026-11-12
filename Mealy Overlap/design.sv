// Code your design here

module mealy_overlap(
    input clk,
    input rst,
    input din,
    output reg dout
);

reg [1:0] ps, ns;

parameter S0 = 2'b00,
          S1 = 2'b01,
          S2 = 2'b10,
          S3 = 2'b11;

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
                ns = S1;
            else
                ns = S2;

        default: ns = S0;

    endcase
end

// Mealy output logic
always @(*)
begin
    dout = 1'b0;

  if ((ps == S3) && (din == 1'b1))
        dout = 1'b1;
end

endmodule
