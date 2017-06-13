`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.06.2017 10:21:44
// Design Name: 
// Module Name: mux_ss
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module treintaydos_to_siete(
    input [31:0]N,
    input [3:0]C,
    output wire [7:0]SEG
    );
    wire [3:0]H;
    
    contador_hexa contado_hexa_seg_inst(
        .N(N),
        .C(C),
        .H(H)
    );
    decoder_7_seg decoder_7_seg_seg_inst(
        .N(H),
        .SEG(SEG)
    );
endmodule
