module multiplexador (
input clk_15s, reset,
input[5:0] segundo,minuto,horas,
output[5:0] out1,out2
);
reg[5:0] nout1,nout2;
reg switch;


assign out1 = nout1;
assign out2 = nout2;

always@(posedge clk_15s) switch = ~switch;

always@(*)begin
  if (~reset)
    switch = 1'b0;
  else begin
    if(switch == 1'b0)begin
      nout1 = minuto;
      nout2 = segundo;end
    else begin
    nout1 = horas;
    nout2 = minuto;end
  end
end

endmodule 
