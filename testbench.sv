// Code your testbench here
// or browse Examples
`timescale 1ns/1ps
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

reg [31:0] expected_z;
reg expected_cout, expected_bout, expected_zero, expected_overflow, expected_negative, expected_carry;
reg start_subtraction = 0;
  
  
  
bit32 U0 (.a(a), .b(b), .sel(sel), .cin(cin), .bin(bin), .cout(cout), .bout(bout), .z(z), .carry(carry), .zero(zero), 
          .overflow(overflow), .negative(negative));
  
  // Task to compute expected results based on operation
task compute_expected;
begin
    if (sel == 2'b01) begin // Addition
        {expected_cout, expected_z} = a + b + cin;
    end
    else if (sel == 2'b10) begin // Subtraction
        {expected_bout, expected_z} = a - b - bin;
    end
    
    expected_zero = ~|expected_z; // Zero flag: True if all bits of expected_z are zero
    expected_negative = expected_z[31]; // Negative flag: True if MSB of expected_z is 1 (sign bit for signed numbers)
    
    if (sel == 2'b01) begin
        expected_overflow = (a[31] == b[31]) && (expected_z[31] != a[31]); // Overflow for addition
    end else if (sel == 2'b10) begin
        expected_overflow = (a[31] != b[31]) && (expected_z[31] != a[31]); // Overflow for subtraction
    end
    
    expected_carry = sel[0] ? expected_cout : expected_bout; // Carry/Borrow based on operation type
end
endtask
  
  
initial begin
        // Initialize Inputs
        a = 0;
        b = 0;
        sel = 0;
        cin = 0;
        bin = 0;
  		#20;
        sel = 2'b01;//addition
        // Wait for global reset
        #50;
  $display ("Start Addition...");
  for (int i = 1; i<=20; i++)begin
    $display("The number of addition test: %d", i);
            a = $random;
            b = $random;
            cin = $random % 2; // Generates values from 0 to 1
            bin = $random % 2; // Generates values from 0 to 1

            compute_expected; // Calculate expected results

            #10; // Time per test cycle

            // Check results against expected
    assert(z === expected_z) else $fatal("Mismatch on z. Expected: %h, Got: %h", expected_z, z);
    assert(cout === expected_cout) else $fatal("Mismatch on cout. Expected: %b, Got: %b", expected_cout, cout);
    assert(zero === expected_zero) else $fatal("Mismatch on zero. Expected: %b, Got: %b", expected_zero, zero);
    assert(overflow === expected_overflow) else $fatal("Mismatch on overflow. Expected: %b, Got: %b", expected_overflow, overflow);
    assert(negative === expected_negative) else $fatal("Mismatch on negative. Expected: %b, Got: %b", expected_negative, negative);
    assert(carry === expected_carry) else $fatal("Mismatch on carry. Expected: %b, Got: %b", expected_carry, carry);
        
  
  if (z == expected_z && cout == expected_cout && zero == expected_zero && overflow == expected_overflow && negative == expected_negative && carry == expected_carry ) begin
    $display ("The %dth addition test is passed", i);
  end
  
  else begin
    $display ("The %dth addition test is failed", i);
    
  end

    end

  //Start subtraction
  
    // Initialize Inputs
        a = 0;
        b = 0;
        sel = 0;
        cin = 0;
        bin = 0;
  		#20;
        sel = 2'b10;//subtraction
        // Wait for global reset
        #50;
  $display ("\n");
  $display ("Start Subtraction...");

  
  for (int i = 1; i<=20; i++)begin
    $display("The number of subtraction" ,i);
            a = $random;
            b = $random;
            cin = $random % 2; // Generates values from 0 to 1
            bin = $random % 2; // Generates values from 0 to 1

            compute_expected; // Calculate expected results

            #10; // Time per test cycle

            // Check results against expected
    assert(z === expected_z) else $fatal("Mismatch on z. Expected: %h, Got: %h", expected_z, z);
    assert(bout === expected_bout) else $fatal("Mismatch on bout. Expected: %b, Got: %b", expected_bout, bout);
    assert(zero === expected_zero) else $fatal("Mismatch on zero. Expected: %b, Got: %b", expected_zero, zero);
    assert(overflow === expected_overflow) else $fatal("Mismatch on overflow. Expected: %b, Got: %b", expected_overflow, overflow);
    assert(negative === expected_negative) else $fatal("Mismatch on negative. Expected: %b, Got: %b", expected_negative, negative);
    assert(carry === expected_carry) else $fatal("Mismatch on carry. Expected: %b, Got: %b", expected_carry, carry);
       
  
  if (z == expected_z && bout == expected_bout && zero == expected_zero && overflow == expected_overflow && negative == expected_negative && carry == expected_carry ) begin
    $display ("The %dth subtraction test is passed", i);
  end
  
  else begin
    $display ("The %dth subtraction test is failed", i);
    
  end

    end
 
    
  	$finish;
  end
  
initial begin
  $dumpfile("bit32.vcd");    // Specify the VCD (Value Change Dump) file to store simulation results
    $dumpvars(0, testbench);
  
  
end



endmodule