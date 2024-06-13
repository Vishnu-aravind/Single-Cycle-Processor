module Immediate_Generator(Instr, ImmExt);
    input [31:0]Instr;
    output reg [31:0]ImmExt;
    always@(*) begin
            ImmExt = {{20{Instr[31]}}, Instr[31:20]};
    end
endmodule
            