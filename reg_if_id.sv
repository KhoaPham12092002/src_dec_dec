  
   input  logic         clk_i,
   input  logic         rst_ni,
  
   input  logic         flushD, 
   input  logic         hazard,
   input  logic [W-1:0] pc,
   input  logic [W-1:0] instr,

   output logic [W-1:0] pc_temp,
   output logic [W-1:0] instr_temp
);
parameter W = 32;
always @(posedge clk_i, negedge rst_ni) begin
   if (!rst_ni) begin
      pc_temp <= 'd0;
      instr_temp <= 'd0;
   end else begin
      if (hazard) begin
         pc_temp    <= pc;
         instr_temp <= instr_temp;
      end else if (flushD) begin
         pc_temp    <= 'd0;
	 instr_temp <= 'd0;
      end else begin
	 pc_temp    <= pc;
	 instr_temp <= instr;
      end
   end
end
endmodule
