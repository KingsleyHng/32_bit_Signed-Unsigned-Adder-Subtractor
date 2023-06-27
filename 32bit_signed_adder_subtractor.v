module FADD (a, b, cin, sum, cout);

input wire a, b, cin;
output wire sum, cout;
wire x1, x2, x3;

xor(x1, a, b);
and (x2, a, b);
xor (sum, x1, cin);
and (x3, x1, cin );
or (cout, x2, x3);

endmodule

module FSUB (a, b, bin, diff, bout);
input wire a, b, bin;
output wire diff, bout;

xor(x1, a, b);
and (x2, ~a, b);
xor (diff, x1, bin);
and (x3, ~x1, bin );
or (bout, x2, x3);

endmodule

module bit1stack(input a, input b, input [1:0]sel, input cin, input bin, output cout, output bout, output z);

wire z1, z2; 
wire add, sub;

FADD U0 ( .a(a), .b(b), .cin(cin), .cout(add), .sum(z1));
FSUB U1 (.a(a), .b(b), .bin(bin), .bout(sub), .diff(z2));


assign z = sel[0] ? z1 : z2;
assign cout = sel [0] ? add : 1'bz;
assign bout = sel [1] ? sub : 1'bz;

endmodule

module bit32(input[31:0]a,
             input[31:0]b, 
             input[1:0]sel,
             input cin,
             input bin,
             output cout,
             output bout,
             output[31:0]z,
             output zero,
             output overflow,
             output negative,
             output carry);

wire [0:30]x;
wire [0:30]y;

bit1stack U0 (.a(a[0]), .b(b[0]), .sel(sel), .cin(cin), .bin(bin), .cout(x[0]), .bout(y[0]), .z(z[0]));
bit1stack U1 (.a(a[1]), .b(b[1]), .sel(sel), .cin(x[0]), .bin(y[0]), .cout(x[1]), .bout(y[1]), .z(z[1]));
bit1stack U2 (.a(a[2]), .b(b[2]), .sel(sel), .cin(x[1]), .bin(y[1]), .cout(x[2]), .bout(y[2]), .z(z[2]));
bit1stack U3 (.a(a[3]), .b(b[3]), .sel(sel), .cin(x[2]), .bin(y[2]), .cout(x[3]), .bout(y[3]), .z(z[3]));
bit1stack U4 (.a(a[4]), .b(b[4]), .sel(sel), .cin(x[3]), .bin(y[3]), .cout(x[4]), .bout(y[4]), .z(z[4]));
bit1stack U5 (.a(a[5]), .b(b[5]), .sel(sel), .cin(x[4]), .bin(y[4]), .cout(x[5]), .bout(y[5]), .z(z[5]));
bit1stack U6 (.a(a[6]), .b(b[6]), .sel(sel), .cin(x[5]), .bin(y[5]), .cout(x[6]), .bout(y[6]), .z(z[6]));
bit1stack U7 (.a(a[7]), .b(b[7]), .sel(sel), .cin(x[6]), .bin(y[6]), .cout(x[7]), .bout(y[7]), .z(z[7]));
bit1stack U8 (.a(a[8]), .b(b[8]), .sel(sel), .cin(x[7]), .bin(y[7]), .cout(x[8]), .bout(y[8]), .z(z[8]));
bit1stack U9 (.a(a[9]), .b(b[9]), .sel(sel), .cin(x[8]), .bin(y[8]), .cout(x[9]), .bout(y[9]), .z(z[9]));
bit1stack U10 (.a(a[10]), .b(b[10]), .sel(sel), .cin(x[9]), .bin(y[9]), .cout(x[10]), .bout(y[10]), .z(z[10]));
bit1stack U11 (.a(a[11]), .b(b[11]), .sel(sel), .cin(x[10]), .bin(y[10]), .cout(x[11]), .bout(y[11]), .z(z[11]));
bit1stack U12 (.a(a[12]), .b(b[12]), .sel(sel), .cin(x[11]), .bin(y[11]), .cout(x[12]), .bout(y[12]), .z(z[12]));
bit1stack U13 (.a(a[13]), .b(b[13]), .sel(sel), .cin(x[12]), .bin(y[12]), .cout(x[13]), .bout(y[13]), .z(z[13]));
bit1stack U14 (.a(a[14]), .b(b[14]), .sel(sel), .cin(x[13]), .bin(y[13]), .cout(x[14]), .bout(y[14]), .z(z[14]));
bit1stack U15 (.a(a[15]), .b(b[15]), .sel(sel), .cin(x[14]), .bin(y[14]), .cout(x[15]), .bout(y[15]), .z(z[15]));
bit1stack U16 (.a(a[16]), .b(b[16]), .sel(sel), .cin(x[15]), .bin(y[15]), .cout(x[16]), .bout(y[16]), .z(z[16]));
bit1stack U17 (.a(a[17]), .b(b[17]), .sel(sel), .cin(x[16]), .bin(y[16]), .cout(x[17]), .bout(y[17]), .z(z[17]));
bit1stack U18 (.a(a[18]), .b(b[18]), .sel(sel), .cin(x[17]), .bin(y[17]), .cout(x[18]), .bout(y[18]), .z(z[18]));
bit1stack U19 (.a(a[19]), .b(b[19]), .sel(sel), .cin(x[18]), .bin(y[18]), .cout(x[19]), .bout(y[19]), .z(z[19]));
bit1stack U20 (.a(a[20]), .b(b[20]), .sel(sel), .cin(x[19]), .bin(y[19]), .cout(x[20]), .bout(y[20]), .z(z[20]));
bit1stack U21 (.a(a[21]), .b(b[21]), .sel(sel), .cin(x[20]), .bin(y[20]), .cout(x[21]), .bout(y[21]), .z(z[21]));
bit1stack U22 (.a(a[22]), .b(b[22]), .sel(sel), .cin(x[21]), .bin(y[21]), .cout(x[22]), .bout(y[22]), .z(z[22]));
bit1stack U23 (.a(a[23]), .b(b[23]), .sel(sel), .cin(x[22]), .bin(y[22]), .cout(x[23]), .bout(y[23]), .z(z[23]));
bit1stack U24 (.a(a[24]), .b(b[24]), .sel(sel), .cin(x[23]), .bin(y[23]), .cout(x[24]), .bout(y[24]), .z(z[24]));
bit1stack U25 (.a(a[25]), .b(b[25]), .sel(sel), .cin(x[24]), .bin(y[24]), .cout(x[25]), .bout(y[25]), .z(z[25]));
bit1stack U26 (.a(a[26]), .b(b[26]), .sel(sel), .cin(x[25]), .bin(y[25]), .cout(x[26]), .bout(y[26]), .z(z[26]));
bit1stack U27 (.a(a[27]), .b(b[27]), .sel(sel), .cin(x[26]), .bin(y[26]), .cout(x[27]), .bout(y[27]), .z(z[27]));
bit1stack U28 (.a(a[28]), .b(b[28]), .sel(sel), .cin(x[27]), .bin(y[27]), .cout(x[28]), .bout(y[28]), .z(z[28]));
bit1stack U29 (.a(a[29]), .b(b[29]), .sel(sel), .cin(x[28]), .bin(y[28]), .cout(x[29]), .bout(y[29]), .z(z[29]));
bit1stack U30 (.a(a[30]), .b(b[30]), .sel(sel), .cin(x[29]), .bin(y[29]), .cout(x[30]), .bout(y[30]), .z(z[30]));
bit1stack U31 (.a(a[31]), .b(b[31]), .sel(sel), .cin(x[30]), .bin(y[30]), .cout(cout), .bout(bout), .z(z[31]));

nor (zero, z[0], z[1], z[2], z[3], z[4], z[5], z[6], z[7], 
     z[8], z[9], z[10], z[11], z[12], z[13], z[14], z[15], 
     z[16], z[17], z[18], z[19], z[20], z[21], z[22], z[23], 
     z[24], z[25], z[26], z[27], z[28], z[29], z[30], z[31] );

assign overflow = sel[0] ? (cout^x[30]) : (bout^y[30]);
assign negative = z[31];
assign carry = sel[0] ? cout : bout;

endmodule