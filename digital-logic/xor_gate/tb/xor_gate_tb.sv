`timescale 1ns/1ps

module xor_gate_tb;
logic [3:0] a;
logic y;

logic yexpected;
int errors = 0;

// Instantiate DUT
xor_gate dut (
    .a(a),
    .y(y)
);

// GTKWave
initial begin
    $dumpfile("xor_gate_waves.vcd"); // File location of waveforms
    $dumpvars(0, xor_gate_tb);
end

// Test Stimuli
initial begin
    for (int i = 0; i < 16; i++) begin
        a = i;            // Set a to binary of i
        #10;              // Wait 10 time units for logic to settle
        yexpected = ^a;

        if (y !== yexpected) begin
            $display("Wrong Value at a = %b", a);
        errors++;
        end
    end

// // For loop above is equivalent to below
    // a[3] = 0; a[2] = 0; a[1] = 0; a[0] = 0; #10;
    // a[3] = 0; a[2] = 0; a[1] = 0; a[0] = 1; #10;
    // a[3] = 0; a[2] = 0; a[1] = 1; a[0] = 0; #10;
    // a[3] = 0; a[2] = 0; a[1] = 1; a[0] = 1; #10;
    // a[3] = 0; a[2] = 1; a[1] = 0; a[0] = 0; #10;
    // a[3] = 0; a[2] = 1; a[1] = 0; a[0] = 1; #10;
    // a[3] = 0; a[2] = 1; a[1] = 1; a[0] = 0; #10;
    // a[3] = 0; a[2] = 1; a[1] = 1; a[0] = 1; #10;
    // a[3] = 1; a[2] = 0; a[1] = 0; a[0] = 0; #10;
    // a[3] = 1; a[2] = 0; a[1] = 0; a[0] = 1; #10;
    // a[3] = 1; a[2] = 0; a[1] = 1; a[0] = 0; #10;
    // a[3] = 1; a[2] = 0; a[1] = 1; a[0] = 1; #10;
    // a[3] = 1; a[2] = 1; a[1] = 0; a[0] = 0; #10;
    // a[3] = 1; a[2] = 1; a[1] = 0; a[0] = 1; #10;
    // a[3] = 1; a[2] = 1; a[1] = 1; a[0] = 0; #10;
    // a[3] = 1; a[2] = 1; a[1] = 1; a[0] = 1; #10;

    if (errors == 0) begin
      $display("--------------------------------------------------");
      $display("SUCCESS: All 16 test cases passed successfully!");
      $display("--------------------------------------------------");
    end else begin
      $display("--------------------------------------------------");
      $display("FAILURE: Simulation finished with %d error(s).", errors);
      $display("--------------------------------------------------");
    end

    $finish;
end
endmodule