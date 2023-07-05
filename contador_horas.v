module horas(
input clk,reset,
output[5:0]out
);

reg[5:0] contador;
reg nclk;

assign out = contador;

always@(posedge clk or negedge reset)begin
  if(~reset)begin
    contador = 1'b0;
    nclk = 0;end
  else begin
    contador = contador + 1;
    if (contador == 6'b011000)begin
      contador = 6'b000000;
      nclk = 1'b1;end
    else
      nclk = 1'b0;
  end
end
endmodule