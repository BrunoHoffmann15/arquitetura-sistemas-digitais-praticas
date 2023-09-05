module test_bench_full_adder_behavior();
  reg  CIN, A, B;
  wire COUT, SUM;
  
  full_adder_behavior fa(CIN, A, B, COUT, SUM);
  
  initial begin
    $dumpfile("dump.vcd");
	$dumpvars(1);
    
    $display("Begin tests Full Adder:");

    A = 1; B = 0; CIN = 0; #10;
    
    $display("Simulation 1: A=%b; B=%b; CIN=%b;", A, B, CIN);
    $display("COUT=%b", COUT);
    $display("SUM=%b", SUM);
    
    A = 1; B = 1; CIN = 0; #10;
    
    $display("Simulation 2: A=%b; B=%b; CIN=%b;", A, B, CIN);
    $display("COUT=%b", COUT);
    $display("SUM=%b", SUM);
    
    A = 1; B = 1; CIN = 1; #10;
    
    $display("Simulation 3: A=%b; B=%b; CIN=%b;", A, B, CIN);
    $display("COUT=%b", COUT);
    $display("SUM=%b", SUM);
    
    $display("End tests Full Adder:");
  end
endmodule

module test_bench_full_adder_8_bits_comportamental();
  reg  CIN, A1, B1, A2, B2, A3, B3, A4, B4, A5, B5, A6, B6, A7, B7, A8, B8;
  wire S1, S2, S3, S4, S5, S6, S7, S8, COUT;
  
  full_adder_8_bits_behavior fa8(CIN, A1, B1, A2, B2, A3, B3, A4, B4, A5, B5, A6, B6, A7, B7, A8, B8, S1, S2, S3, S4, S5, S6, S7, S8, COUT);
  
  initial begin
    #40
    $dumpfile("full_adder_8_bits.vcd");
	$dumpvars(1);
    
    $display("Begin tests Full Adder 8 bits:");
    
    A8 = 1; A7 = 1; A6 = 1; A5 = 1; A4 = 1; A3 = 1; A2 = 1; A1 = 1; 
    B8 = 0; B7 = 0; B6 = 0; B5 = 0; B4 = 0; B3 = 0; B2 = 0; B1 = 0; 
    CIN = 0; #100;
    
    $display("Simulation 1: A=%b%b%b%b %b%b%b%b; B=%b%b%b%b %b%b%b%b; Sum=%b%b%b%b %b%b%b%b; Cout=%b;", A8, A7, A6, A5, A4, A3, A2, A1, B8, B7, B6, B5, B4, B3, B2, B1, S8, S7, S6, S5, S4, S3, S2, S1, COUT);
    
    A8 = 0; A7 = 0; A6 = 0; A5 = 1; A4 = 1; A3 = 0; A2 = 0; A1 = 1; 
    B8 = 1; B7 = 0; B6 = 0; B5 = 1; B4 = 0; B3 = 1; B2 = 0; B1 = 1; 
    CIN = 0; #100;
    
    $display("Simulation 2: A=%b%b%b%b %b%b%b%b; B=%b%b%b%b %b%b%b%b; Sum=%b%b%b%b %b%b%b%b; Cout=%b;", A8, A7, A6, A5, A4, A3, A2, A1, B8, B7, B6, B5, B4, B3, B2, B1, S8, S7, S6, S5, S4, S3, S2, S1, COUT);
    
    A8 = 1; A7 = 0; A6 = 0; A5 = 1; A4 = 1; A3 = 0; A2 = 0; A1 = 1; 
    B8 = 0; B7 = 0; B6 = 0; B5 = 1; B4 = 0; B3 = 1; B2 = 0; B1 = 1; 
    CIN = 0; #100;
    
    $display("Simulation 3: A=%b%b%b%b %b%b%b%b; B=%b%b%b%b %b%b%b%b; Sum=%b%b%b%b %b%b%b%b; Cout=%b;", A8, A7, A6, A5, A4, A3, A2, A1, B8, B7, B6, B5, B4, B3, B2, B1, S8, S7, S6, S5, S4, S3, S2, S1, COUT);
    

    $display("End tests Full Adder 8 bits:");
  end
endmodule