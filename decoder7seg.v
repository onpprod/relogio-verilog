module BCDto7SEGMENT(
input[3:0] in,
output[6:0] out);


reg  [6:0] SeteSegmentos;

always @(*)
  case(in)
            4'b0000: SeteSegmentos = 7'b1111110;
            4'b0001: SeteSegmentos = 7'b0110000;
            4'b0010: SeteSegmentos = 7'b1101101;
            4'b0011: SeteSegmentos = 7'b1111001;
            4'b0100: SeteSegmentos = 7'b0110011;
            4'b0101: SeteSegmentos = 7'b1011011;
            4'b0110: SeteSegmentos = 7'b0011111;
            4'b0111: SeteSegmentos = 7'b1110000;
            4'b1000: SeteSegmentos = 7'b1111111;
            4'b1001: SeteSegmentos = 7'b1110011;
            default: SeteSegmentos = 7'b0000000;
        endcase

assign out = SeteSegmentos;

endmodule