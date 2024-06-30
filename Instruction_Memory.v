module Instruction_Memory(read_addr, Instr_out);
    input [31:0]read_addr;
    output [31:0]Instr_out;
    reg [31:0]mem1[84:0];
initial begin
    mem1[0]  <= 32'b00000000010011111000001001100111; // jalr x4,x31,4    
    mem1[4]  <= 32'b00000000000001010000000010110011; // add x1 , x10 , x0   
    mem1[8]  <= 32'b00000000000000111000010100110011; // add x10 , x7 , x0   
    mem1[12] <= 32'b00000000000000010000001110110011;     
    mem1[16] <= 32'b00000000000001011000000100110011;
    mem1[20] <= 32'b00000000000000111000010110110011;
    mem1[24] <= 32'b00000000000000011000001110110011;
    mem1[28] <= 32'b00000000000001100000000110110011;
    mem1[32] <= 32'b00000000000000111000011000110011;
    mem1[36] <= 32'b00000000000000100000001110110011;
    mem1[40] <= 32'b00000000000001101000001000110011;
    mem1[44] <= 32'b00000000000000111000011010110011;
    mem1[48] <= 32'b00000001010000000000101100010011; //addi x22,x0,20
    mem1[52] <= 32'b00000001011011110010000000100011; //sw x22,0(x30)
    
    mem1[56] <= 32'b00000000010011111000001001100111; //jalr x4,x31,4
    mem1[60] <= 32'b00000001100000000000111100010011; //addi x30,x0,24
    
    mem1[64] <= 32'b00000001110011101111110010110011; //and x25, x29, x28


end
assign Instr_out = mem1[read_addr];
endmodule