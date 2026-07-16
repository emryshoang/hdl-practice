`timescale 1ns/1ps

module and_gate_tb;
// Local Signal Declaration
logic a;
logic b;
logic y;

// Instantiate DUT
and_gate dut (
    .a(a),
    .b(b),
    .y(y)
);

// GTKWave
initial begin
    $dumpfile("and_gate_waves.vcd"); // File location of waveforms
    $dumpvars(0, and_gate_tb);       // Record all signals in tb
end

// Test Stimuli
initial begin
    // Test all 4 combinations of inputs
    a = 0; b = 0; #10; 
    a = 0; b = 1; #10;
    a = 1; b = 0; #10;
    a = 1; b = 1; #10;

    $finish;
end
endmodule