module Control_Unit (Opcode,ALUSrc,MemtoReg,MemRead,MemWrite,Branch,RegWrite,ALUOp,cnt1,cnt2);
    input [6:0] Opcode;
    output reg ALUSrc,MemtoReg,MemRead,MemWrite,Branch,RegWrite,cnt1,cnt2;
    output reg [1:0] ALUOp;

always@(*) begin
    case (Opcode)
        7'b0110011:
        begin
            ALUSrc   <= 0;
            MemtoReg <= 0;
            MemRead  <= 0;           
            MemWrite <= 0;
            Branch   <= 0;
            RegWrite <= 1;
            cnt1     <= 0;
            cnt2     <= 0;          
            ALUOp    <= 2'b10;
        end 
        7'b0010011:
        begin
            ALUSrc   <= 1;
            MemtoReg <= 0;
            MemRead  <= 0;
            MemWrite <= 0;
            Branch   <= 0;
            RegWrite <= 1;
            cnt1     <= 0;
            cnt2     <= 0;           
            ALUOp    <= 2'b10;
        end
        7'b1100011:
        begin
            ALUSrc   <= 0;
            MemtoReg <= 0;
            MemRead  <= 0;
            MemWrite <= 0;
            Branch   <= 1;
            RegWrite <= 0;
            cnt1     <= 0;
            cnt2     <= 0;            
            ALUOp    <= 2'b01;
        end
        7'b0000011:
        begin
            ALUSrc   <= 1;
            MemtoReg <= 1;
            MemRead  <= 1;
            MemWrite <= 0;
            Branch   <= 0;
            RegWrite <= 1;
            cnt1     <= 0;
            cnt2     <= 0;            
            ALUOp    <= 2'b00;
        end
        7'b0100011:
        begin
            ALUSrc   <= 1;
            MemtoReg <= 0;
            MemRead  <= 0;
            MemWrite <= 1;
            Branch   <= 0;
            RegWrite <= 0;
            cnt1     <= 0;
            cnt2     <= 0;           
            ALUOp    <= 2'b00;
        end
        7'b1100111:
        begin
            ALUSrc   <= 0;
            MemtoReg <= 0;
            MemRead  <= 0;
            MemWrite <= 0;
            Branch   <= 1;
            RegWrite <= 1;
            cnt1     <= 1;
            cnt2     <= 1;            
            ALUOp    <= 2'b11;
        end
        7'b1101111:
        begin
            ALUSrc   <= 0;
            MemtoReg <= 0;
            MemRead  <= 0;
            MemWrite <= 0;
            Branch   <= 1;
            RegWrite <= 1;
            cnt1     <= 1;
            cnt2     <= 0;            
            ALUOp    <= 2'b11;
        end
        default: 
        begin
            ALUSrc   <= 0;
            RegWrite <= 1;
            ALUOp    <= 2'b10;
        end 
    endcase
    
end
    
endmodule