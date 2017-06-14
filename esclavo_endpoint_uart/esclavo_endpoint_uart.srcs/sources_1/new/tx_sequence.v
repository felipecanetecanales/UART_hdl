`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2017 20:12:52
// Design Name: 
// Module Name: tx_sequence
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
module TX_sequence 
(
	input clock,
	input reset,
	input PB,             //PushButton
	output reg send16,    // Si esta alto, se deben transmitir 16 bits (2 bytes)
    input busy);         // Si esta alto, la UART se encuentra transmitiendo un dato
    
    reg[1:0] next_state, state; 

    //state encoding
    localparam IDLE 		 = 2'd0;  // Esperando dato
    localparam TX_RESULTADO  = 2'd1;  // Transmitiendo el primer operando

    // combo logic of FSM
    always@(*) begin
        //default assignments
        next_state = state;
        send16 = 1'b1;
    	
    	case (state)
    		IDLE: 	begin
						if(PB & ~busy) begin
							next_state=TX_RESULTADO;
						end
					end


            TX_RESULTADO: begin
                         
                            if(~busy) begin
                                next_state=IDLE;
                            end
						end	
    	endcase
    end	

    //when clock ticks, update the state
    always@(posedge clock) begin
    	if(reset)
    		state <= IDLE;
    	else
    		state <= next_state;
	end
	
endmodule
