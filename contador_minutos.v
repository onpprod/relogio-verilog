module minutos(
input clk,reset,
output[5:0]out,
output newclk
);

reg[5:0] contador;
reg nclk;

assign out = contador;
assign newclk = nclk;

always@(posedge clk or negedge reset)begin
  if(~reset) begin
    contador = 1'b0;
    nclk = 1'b0;end
  else begin  
    contador = contador + 1;
    if (contador == 6'b111100)begin
      contador = 6'b000000;
      nclk = 1'b1;end
    else
      nclk = 1'b0;
  end
end
endmodule
