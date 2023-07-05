module relogio(
input clk,reset,
output[6:0] display3 , display2, display1, display0);

wire clk_1s, clk_15s, clk_s , clk_min;
wire[5:0] outseg,outmin,outhora,display_d1,display_d0;
wire[3:0] BCDdisplay3 ,BCDdisplay2 ,BCDdisplay1 ,BCDdisplay0;


clk_gen         U1 (clk,reset,clk_1s,clk_15s);
segundos        U2 (clk_1s,reset,outseg,clk_s);
minutos         U3 (clk_s,reset,outmin,clk_min);
horas           U4 (clkmin,reset,outhora);
multiplexador   U5 (clk_15s,reset,outseg,outmin,outhora,display_d1,display_d0);

decodetoBCD     U10(display_d1,BCDdisplay3,BCDdisplay2);
decodetoBCD     U20(display_d0,BCDdisplay1,BCDdisplay0);

BCDto7SEGMENT   U11(BCDdisplay3,display3);
BCDto7SEGMENT   U12(BCDdisplay2,display2);

BCDto7SEGMENT   U21(BCDdisplay1,display1);
BCDto7SEGMENT   U22(BCDdisplay0,display0);


endmodule
