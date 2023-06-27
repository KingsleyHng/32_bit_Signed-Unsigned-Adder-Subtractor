`timescale 1ns/1ns
`include "32bit_signed_adder_subtractor.v"

module testbench;

reg [31:0]a;
reg [31:0]b;
reg [1:0]sel;
reg cin;
reg bin;
wire cout;
wire bout;
wire [31:0]z;
wire carry;
wire zero;
wire overflow;
wire negative;
integer  i;
integer k;
bit32 U0 (.a(a), .b(b), .sel(sel), .cin(cin), .bin(bin), .cout(cout), .bout(bout), .z(z), .carry(carry), .zero(zero), 
          .overflow(overflow), .negative(negative));

initial begin
    $dumpfile("bit32.vcd");
    $dumpvars();

    for(i = 0; i<5; i=i+1) begin //Addition
        sel = 2'b01;
        a = $random;
        b = $random;
        cin = $random;
        bin = $random;
    #5;
    end
    
    #5;
    for(k = 0; k<5; k=k+1) begin //Subtraction
        sel = 2'b10;
        a = $random;
        b = $random;
        cin = $random;
        bin = $random;
    #5;
    end


end



endmodule