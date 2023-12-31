module test_bench_full_adder_behavior();
  reg  CIN, A, B;
  wire COUT, SUM;
  
  full_adder_behavior fa(CIN, A, B, COUT, SUM);
  
  initial begin
    $dumpfile("dump.vcd");
	  $dumpvars(1);
    
    $display("Begin tests Full Adder:");

    A = 1; B = 0; CIN = 0; #10;
    
    $display("Simulation 1: A=%b; B=%b; CIN=%b; COUT=%b; SUM=%b;", A, B, CIN, COUT, SUM);

    if (COUT != 0 | SUM != 1) $display("Failed on scenario 1 should be SUM=1; COUT=0");
    
    A = 1; B = 1; CIN = 0; #10;
    
    $display("Simulation 2: A=%b; B=%b; CIN=%b; COUT=%b; SUM=%b;", A, B, CIN, COUT, SUM);

    if (COUT != 1 | SUM != 0) $display("Failed on scenario 1 should be SUM=0; COUT=1");
    
    A = 1; B = 1; CIN = 1; #10;
    
    $display("Simulation 3: A=%b; B=%b; CIN=%b; COUT=%b; SUM=%b;", A, B, CIN, COUT, SUM);

    if (COUT != 1 | SUM != 1) $display("Failed on scenario 1 should be SUM=1; COUT=1");

    A = 0; B = 1; CIN = 0; #10;
    
    $display("Simulation 4: A=%b; B=%b; CIN=%b; COUT=%b; SUM=%b;", A, B, CIN, COUT, SUM);

    if (COUT != 0 | SUM != 1) $display("Failed on scenario 1 should be SUM=1; COUT=0");
    
    $display("End tests Full Adder:");
  end
endmodule

module test_bench_full_adder_8_bits_comportamental();
  reg  CIN, A1, B1, A2, B2, A3, B3, A4, B4, A5, B5, A6, B6, A7, B7, A8, B8;
  wire S1, S2, S3, S4, S5, S6, S7, S8, COUT;
  
  full_adder_8_bits_behavior fa8(CIN, A1, B1, A2, B2, A3, B3, A4, B4, A5, B5, A6, B6, A7, B7, A8, B8, S1, S2, S3, S4, S5, S6, S7, S8, COUT);
  
  initial begin
    #50
    $dumpfile("full_adder_8_bits.vcd");
	  $dumpvars(1);
    
    $display("Begin tests Full Adder 8 bits:");

    // Simulation 1:
    // A = 1111 1111
    // B = 0000 0000
    // SUM = 1111 1111
    
    A8 = 1; A7 = 1; A6 = 1; A5 = 1; A4 = 1; A3 = 1; A2 = 1; A1 = 1; 
    B8 = 0; B7 = 0; B6 = 0; B5 = 0; B4 = 0; B3 = 0; B2 = 0; B1 = 0; 
    CIN = 0; #100;
    
    $display("Simulation 1: A=%b%b%b%b %b%b%b%b; B=%b%b%b%b %b%b%b%b; Sum=%b%b%b%b %b%b%b%b; Cout=%b;", A8, A7, A6, A5, A4, A3, A2, A1, B8, B7, B6, B5, B4, B3, B2, B1, S8, S7, S6, S5, S4, S3, S2, S1, COUT);

    if (S1 !== 1 | S2 !==1 | S3 !==1 | S4 !==1 | S5 !==1 | S6 !==1| S7 !==1 | S8 !==1) $display("Failed on scenario 1 should be 1111 1111.");

    // Simulation 2:
    // A = 1000 1000
    // B = 0010 0110
    // SUM = 1010 1110

    A8 = 1; A7 = 0; A6 = 0; A5 = 0; A4 = 1; A3 = 0; A2 = 0; A1 = 0; 
    B8 = 0; B7 = 0; B6 = 1; B5 = 0; B4 = 0; B3 = 1; B2 = 1; B1 = 0; 
    CIN = 0; #100;
    
    $display("Simulation 2: A=%b%b%b%b %b%b%b%b; B=%b%b%b%b %b%b%b%b; Sum=%b%b%b%b %b%b%b%b; Cout=%b;", A8, A7, A6, A5, A4, A3, A2, A1, B8, B7, B6, B5, B4, B3, B2, B1, S8, S7, S6, S5, S4, S3, S2, S1, COUT);

    if (S1 !== 0 | S2 !==1 | S3 !==1 | S4 !==1 | S5 !==0 | S6 !==1| S7 !==0 | S8 !==1) $display("Failed on scenario 2 should be 1010 1110.");

    // Simulation 3:
    // A = 1100 0011
    // B = 0011 1100
    // SUM = 1111 1111

    A8 = 1; A7 = 1; A6 = 0; A5 = 0; A4 = 0; A3 = 0; A2 = 1; A1 = 1; 
    B8 = 0; B7 = 0; B6 = 1; B5 = 1; B4 = 1; B3 = 1; B2 = 0; B1 = 0; 
    CIN = 0; #100;
    
    $display("Simulation 3: A=%b%b%b%b %b%b%b%b; B=%b%b%b%b %b%b%b%b; Sum=%b%b%b%b %b%b%b%b; Cout=%b;", A8, A7, A6, A5, A4, A3, A2, A1, B8, B7, B6, B5, B4, B3, B2, B1, S8, S7, S6, S5, S4, S3, S2, S1, COUT);

    if (S1 !== 1 | S2 !==1 | S3 !==1 | S4 !==1 | S5 !==1 | S6 !==1| S7 !==1 | S8 !==1) $display("Failed on scenario 3 should be 1111 1111.");

    // Simulation 4:
    // A = 1001 1000
    // B = 0011 0110
    // SUM = 1100 1110

    A8 = 1; A7 = 0; A6 = 0; A5 = 1; A4 = 1; A3 = 0; A2 = 0; A1 = 0; 
    B8 = 0; B7 = 0; B6 = 1; B5 = 1; B4 = 0; B3 = 1; B2 = 1; B1 = 0; 
    CIN = 0; #100;
    
    $display("Simulation 4: A=%b%b%b%b %b%b%b%b; B=%b%b%b%b %b%b%b%b; Sum=%b%b%b%b %b%b%b%b; Cout=%b;", A8, A7, A6, A5, A4, A3, A2, A1, B8, B7, B6, B5, B4, B3, B2, B1, S8, S7, S6, S5, S4, S3, S2, S1, COUT);

    if (S1 !== 0 | S2 !==1 | S3 !==1 | S4 !==1 | S5 !==0 | S6 !==0 | S7 !==1 | S8 !==1) $display("Failed on scenario 4 should be 1100 1110.");

    $display("End tests Full Adder 8 bits:");
  end
endmodule