module architecture(input clk);
wire [31:0] Writedata,immediateout, RD1,RD2, Mux1output,Mux2output;
wire [31:0] RD, PC,pc_4,shift_out,shift_adderout;
wire [3:0] Control; 
wire [1:0] ALUOp;
reg [31:0] pc;
wire sel,ALUSrc,MemRead,MemWrite,Branch,zero,MemtoReg;
wire RegWrite;
initial begin
    pc<=32'b0;
end
Program_Counter P1(clk,pc,PC);
adder a1(PC,pc_4);
Instruction_Memory I1(PC,RD);
Control_Unit M1(RD[6:0],ALUSrc,MemtoReg,MemRead,MemWrite,Branch,RegWrite,ALUOp);
Register_File R1(RegWrite,RD[19:15],RD[24:20],RD[11:7],Writedata,RD1,RD2);
Immediate_Generator S1(RD[31:0],immediateout);
shift s1(immediateout,shift_out);
adderB a2(PC,shift_out,shift_adderout);
assign sel = (Branch & zero);
MUX D1(pc_4,shift_adderout,sel,Mux2output);
always @(Mux2output) begin
    pc = Mux2output;
    end
MUX M4(RD2,immediateout,ALUSrc,Mux1output);
ALU_Control A3(ALUOp,RD[30],RD[14:12],Control);
ALU A2(RD1,Mux1output,Control,Writedata,zero);
endmodule