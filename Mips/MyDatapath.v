module MyDatapath(
    input clk
);

wire [31:0] instruction;
wire control_memreg;
wire control_memwrite;
wire control_memread;
wire control_regwrite;
wire [2:0] control_aluop;
wire [31:0] data_write;
wire [31:0] data_read1;
wire [31:0] data_read2;
wire [3:0] control_alusel;
wire [31:0] alu_result;
wire [31:0] address_result;
wire [31:0] data_mem;
wire RegDst;
wire [4:0] Dir_Wri_BR;
wire ALU_Src;
wire [31:0] Oper_2;
wire [31:0] Mux_ALU_in2;
wire [31:0] pc_out;
wire [31:0] add_result;
wire [31:0] SL2_adder;
wire [31:0] Add_In2_MuxPC;
wire Branch;
wire tr_zf;
wire [31:0] MuxPC_PCin;
wire Jump;
wire [27:0]JAddress;
wire [31:0]MPC_MJ; 


MyPC _PC(.clk(clk),.in(MuxPC_PCin),.out(pc_out));
MyADD_4 _ADD(.operand(pc_out),.result(add_result));
MyIMem _IM(.address(pc_out),.data(instruction));
MyBR _BR(.address_reg1(instruction[25:21]), .address_reg2(instruction[20:16]), .address_write(Dir_Wri_BR), .data_write(data_write), .enable(control_regwrite), .data_read1(data_read1), .data_read2(data_read2));
MyControlUnit _ControlUnit(.opcode(instruction[31:26]), .reg_Dst(RegDst), .branch(Branch), .memory_read(control_memread), .memory_register(control_memreg), .alu_operation(control_aluop), .memory_write(control_memwrite), .ALU_Src(ALU_Src), .reg_write(control_regwrite), .jump(Jump));
MyALUControl _ALUControl(.alu_operation(control_aluop), .function_code(instruction[5:0]), .alu_select(control_alusel));
MyALU _ALU(.operand1(data_read1), .operand2(Oper_2), .alu_select(control_alusel), .zero_flag(tr_zf) ,.result(alu_result));
MyMem _Mem(.address(alu_result), .data_write(data_read2), .write_enable(control_memwrite), .read_enable(control_memread), .data_read(data_mem));
MyDatapathMux _MuxWriteBR(.control_signal(control_memreg),.input_data_1(alu_result),.input_data_2(data_mem), .output_data(data_write));
MyDatapathMux_5B _Mux_Dir_BR(.control_signal(RegDst), .input_data_1(instruction[20:16]), .input_data_2(instruction[15:11]), .output_data(Dir_Wri_BR));
MyDatapathMux _Mux_D2_ALU(.control_signal(ALU_Src), .input_data_1(data_read2), .input_data_2(Mux_ALU_in2), .output_data(Oper_2));
sign_extend _Sig_Ext(.Data_in(instruction[15:0]), .Data_out(Mux_ALU_in2));
Shift_Left_2 _Sh_Lef_2(.SL_in(Mux_ALU_in2), .SL_out(SL2_adder));
ADDER _Sumador(.O1(add_result), .O2(SL2_adder), .Res(Add_In2_MuxPC));
MyDatapathMux _Mux_PC(.control_signal(Branch&tr_zf), .input_data_1(add_result), .input_data_2(Add_In2_MuxPC), .output_data(MPC_MJ));
MyDatapathMux _Mux_J(.control_signal(Jump), .input_data_1(MPC_MJ), .input_data_2(    {add_result[31:28],JAddress}   ), .output_data(MuxPC_PCin));
Shift_Left_26_28 _SL_26_28(.SL_in(instruction[25:0]), .SL_out(JAddress));



initial
begin
$readmemb("Inicialización Memoria de Instrucciones.txt",_IM.memory);
$readmemb("Inicialización BR.txt",_BR.memory);
$readmemb("Inicialización Memoria de Datos.txt",_Mem.memory);
end

endmodule
