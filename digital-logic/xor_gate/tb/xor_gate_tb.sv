`timescale 1ns/1ps

module xor_gate_tb;
logic [3:0] a;
logic y;

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

    // Test all 16 cases
    a[3] = 0; a[2] = 0; a[1] = 0; a[0] = 0; #10;
    a[3] = 0; a[2] = 0; a[1] = 0; a[0] = 1; #10;
    a[3] = 0; a[2] = 0; a[1] = 1; a[0] = 0; #10;
    a[3] = 0; a[2] = 0; a[1] = 1; a[0] = 1; #10;
    a[3] = 0; a[2] = 1; a[1] = 0; a[0] = 0; #10;
    a[3] = 0; a[2] = 1; a[1] = 0; a[0] = 1; #10;
    a[3] = 0; a[2] = 1; a[1] = 1; a[0] = 0; #10;
    a[3] = 0; a[2] = 1; a[1] = 1; a[0] = 1; #10;
    a[3] = 1; a[2] = 0; a[1] = 0; a[0] = 0; #10;
    a[3] = 1; a[2] = 0; a[1] = 0; a[0] = 1; #10;
    a[3] = 1; a[2] = 0; a[1] = 1; a[0] = 0; #10;
    a[3] = 1; a[2] = 0; a[1] = 1; a[0] = 1; #10;
    a[3] = 1; a[2] = 1; a[1] = 0; a[0] = 0; #10;
    a[3] = 1; a[2] = 1; a[1] = 0; a[0] = 1; #10;
    a[3] = 1; a[2] = 1; a[1] = 1; a[0] = 0; #10;
    a[3] = 1; a[2] = 1; a[1] = 1; a[0] = 1; #10;
    
    $finish;
end
endmodule