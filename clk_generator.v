module clk_gen (
  input wire clk,
  input wire reset,
  output wire clk_1seg,
  output wire clk_15seg
  );
  
  reg[14:0] contador1;
  reg[3:0] contador15;
  reg clk1,clk15;

  assign clk_1seg  = clk1;    // 1s para 27mhz
  assign clk_15seg = clk15;   // 15s
  
//=====================================================
  always @(posedge clk or negedge reset) begin
    if (~reset)
      contador1 = 15'b000000000000000;
    else begin
      
      contador1 = contador1 + 15'b000000000000001;
      if (contador1 == 15'b110100101111000)begin
        contador1 = 15'b000000000000000;
        clk1 = 1'b1;
        end
      else
        clk1 = 1'b0;
    end
  end
//=====================================================  
  always @(posedge clk1 or negedge reset) begin
    if (~reset)
      contador15 = 4'b0000;
    else begin
      contador15 = contador15 + 4'b0001;
      if (contador15 == 4'b1111)begin
        contador1 = 4'b0000;
        clk15 = 1'b1;
        end
      else
        clk15 = 1'b0;
    end
  end

endmodule
