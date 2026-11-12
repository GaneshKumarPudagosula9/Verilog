// Code your design here
module cla(
    input e,
    output wire [4:0] s,
    output wire [3:0] c,
    output wire g3, g2, g1, g0,
    output wire p3, p2, p1, p0,
    input wire a3, a2, a1, a0,
    input wire b3, b2, b1, b0
);

wire c0, c1, c2, c3;

// Generate logic
assign g3 = a3 & b3;
assign g2 = a2 & b2;
assign g1 = a1 & b1;
assign g0 = a0 & b0;

// Propagate logic
assign p0 = a0 ^ b0;
assign p1 = a1 ^ b1;
assign p2 = a2 ^ b2;
assign p3 = a3 ^ b3;

// Carry Look-Ahead logic
assign c0 = (g0 | (p0 & e));
assign c1 = (g1 | (p1 & c0));
assign c2 = (g2 | (p2 & c1));
assign c3 = (g3 | (p3 & c2));

// Sum logic
assign s[0] = a0 ^ b0 ^ e;
assign s[1] = a1 ^ b1 ^ c0;
assign s[2] = a2 ^ b2 ^ c1;
assign s[3] = a3 ^ b3 ^ c2;

// Final carry output
assign s[4] = c3;

// Carry output mapping
assign c[0] = c0;
assign c[1] = c1;
assign c[2] = c2;
assign c[3] = c3;

endmodule

  