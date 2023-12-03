module MyPC(
	input clk,
	input [31:0]in,
	output reg [31:0]out);

initial
begin
	out = 32'b0;
end
	
always@(clk)
begin
	if(clk)	
	begin
		out = in;
	end
end
endmodule
