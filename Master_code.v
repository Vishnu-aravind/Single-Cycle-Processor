module architecture(input clk);
wire [31:0] Writedata1,Writedata2,Writedata3,immediateout, RD1,RD2, Mux1output,Mux2output;
wire [31:0] RD, PC,pc_4,shift_out,shift_adderout,Readdata,mux_in_d1;
wire [3:0] Control; 
wire [1:0] ALUOp;
reg [31:0] pc;
wire sel,ALUSrc,MemRead,MemWrite,Branch,zero,MemtoReg;
wire RegWrite,cntrl1,cntrl2;
initial begin
    pc<=32'b0;
end
Program_Counter P1(clk,pc,PC);
adder a1(PC,pc_4);
Instruction_Memory I1(PC,RD);
Control_Unit M1(RD[6:0],ALUSrc,MemtoReg,MemRead,MemWrite,Branch,RegWrite,ALUOp,cntrl1,cntrl2);
Register_File R1(RegWrite,RD[19:15],RD[24:20],RD[11:7],Writedata3,RD1,RD2);
MUX M7(PC,RD1,cntrl2,mux_in_d1);
Immediate_Generator S1(RD[31:0],immediateout);
shift s1(immediateout,shift_out);
adderB a2(mux_in_d1,shift_out,shift_adderout);
assign sel = (Branch & zero);
MUX D1(pc_4,shift_adderout,sel,Mux2output);

always @(Mux2output) begin
    pc = Mux2output;
    end
MUX M4(RD2,immediateout,ALUSrc,Mux1output);
ALU_Control A3(ALUOp,RD[30],RD[14:12],Control);
ALU A2(RD1,Mux1output,Control,Writedata1,zero);
datamemory d1(Writedata1,RD2,MemRead,MemWrite,Readdata);
MUX M5(Writedata1,Readdata,MemtoReg,Writedata2);
MUX M6(Writedata2,pc_4,cntrl1,Writedata3);
endmodule