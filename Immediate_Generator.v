module Immediate_Generator(Instr, ImmExt);
    input [31:0]Instr;
    output reg [31:0]ImmExt;
    wire [6:0]opcode =Instr[6:0]; 
    always@(*) begin
        case (opcode)
            7'b0110011: ImmExt = {{20{Instr[31]}}, Instr[31:20]};
            7'b0010011: ImmExt = {{20{Instr[31]}}, Instr[31:20]};
            7'b1100011: {ImmExt[31:13],ImmExt[0],ImmExt[12],ImmExt[10:5],ImmExt[4:1],ImmExt[11]} = {{20{Instr[31]}},Instr[31:25],Instr[11:7]};
            7'b0100011: ImmExt = {{20{Instr[31]}},Instr[31:25],Instr[11:7]};
            7'b1101111: {ImmExt[31:21],ImmExt[0],ImmExt[20],ImmExt[10:1],ImmExt[11],ImmExt[19:12]} = {{12{Instr[31]}},Instr[31:12]};
            7'b1100111: ImmExt = {{20{Instr[31]}}, Instr[31:20]};
            default: ImmExt = {{20{Instr[31]}}, Instr[31:20]};
        endcase
            
    end
endmodule
            