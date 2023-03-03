-- Copyright (C) 2022  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 22.1std.0 Build 915 10/25/2022 SC Lite Edition"

-- DATE "03/02/2023 23:02:08"

-- 
-- Device: Altera 5CSEMA5F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim (VHDL) only
-- 

LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Fulladder_4 IS
    PORT (
	inA : IN std_logic_vector(3 DOWNTO 0);
	inB : IN std_logic_vector(3 DOWNTO 0);
	Cin : IN std_logic;
	Sum4 : OUT std_logic_vector(6 DOWNTO 0);
	Cout : OUT std_logic
	);
END Fulladder_4;

-- Design Ports Information
-- Sum4[0]	=>  Location: PIN_AD10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sum4[1]	=>  Location: PIN_AH4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sum4[2]	=>  Location: PIN_AG8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sum4[3]	=>  Location: PIN_AE7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sum4[4]	=>  Location: PIN_AE11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sum4[5]	=>  Location: PIN_AF5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sum4[6]	=>  Location: PIN_AG3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Cout	=>  Location: PIN_AC9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- inA[0]	=>  Location: PIN_AG7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- inB[0]	=>  Location: PIN_AJ1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Cin	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- inA[1]	=>  Location: PIN_AD7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- inB[1]	=>  Location: PIN_AG1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- inA[2]	=>  Location: PIN_AF8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- inB[2]	=>  Location: PIN_AF4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- inA[3]	=>  Location: PIN_AF9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- inB[3]	=>  Location: PIN_AH2,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Fulladder_4 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_inA : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_inB : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_Cin : std_logic;
SIGNAL ww_Sum4 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_Cout : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \Cin~input_o\ : std_logic;
SIGNAL \inA[0]~input_o\ : std_logic;
SIGNAL \inB[0]~input_o\ : std_logic;
SIGNAL \S0|Sum1~combout\ : std_logic;
SIGNAL \inA[1]~input_o\ : std_logic;
SIGNAL \inB[1]~input_o\ : std_logic;
SIGNAL \S1|Sum1~combout\ : std_logic;
SIGNAL \S1|Cout~0_combout\ : std_logic;
SIGNAL \inB[3]~input_o\ : std_logic;
SIGNAL \inA[3]~input_o\ : std_logic;
SIGNAL \inB[2]~input_o\ : std_logic;
SIGNAL \inA[2]~input_o\ : std_logic;
SIGNAL \S3|Sum1~combout\ : std_logic;
SIGNAL \S2|Sum1~combout\ : std_logic;
SIGNAL \conv|Mux6~0_combout\ : std_logic;
SIGNAL \conv|Mux5~0_combout\ : std_logic;
SIGNAL \conv|Mux4~0_combout\ : std_logic;
SIGNAL \conv|Mux3~0_combout\ : std_logic;
SIGNAL \conv|Mux2~0_combout\ : std_logic;
SIGNAL \conv|Mux1~0_combout\ : std_logic;
SIGNAL \conv|Mux0~0_combout\ : std_logic;
SIGNAL \S3|Cout~0_combout\ : std_logic;
SIGNAL \S0|ALT_INV_Sum1~combout\ : std_logic;
SIGNAL \S1|ALT_INV_Sum1~combout\ : std_logic;
SIGNAL \S1|ALT_INV_Cout~0_combout\ : std_logic;
SIGNAL \S2|ALT_INV_Sum1~combout\ : std_logic;
SIGNAL \ALT_INV_inB[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_inA[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_inB[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_inA[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_inB[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_inA[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_Cin~input_o\ : std_logic;
SIGNAL \ALT_INV_inB[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_inA[0]~input_o\ : std_logic;
SIGNAL \conv|ALT_INV_Mux6~0_combout\ : std_logic;
SIGNAL \S3|ALT_INV_Sum1~combout\ : std_logic;

BEGIN

ww_inA <= inA;
ww_inB <= inB;
ww_Cin <= Cin;
Sum4 <= ww_Sum4;
Cout <= ww_Cout;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\S0|ALT_INV_Sum1~combout\ <= NOT \S0|Sum1~combout\;
\S1|ALT_INV_Sum1~combout\ <= NOT \S1|Sum1~combout\;
\S1|ALT_INV_Cout~0_combout\ <= NOT \S1|Cout~0_combout\;
\S2|ALT_INV_Sum1~combout\ <= NOT \S2|Sum1~combout\;
\ALT_INV_inB[3]~input_o\ <= NOT \inB[3]~input_o\;
\ALT_INV_inA[3]~input_o\ <= NOT \inA[3]~input_o\;
\ALT_INV_inB[2]~input_o\ <= NOT \inB[2]~input_o\;
\ALT_INV_inA[2]~input_o\ <= NOT \inA[2]~input_o\;
\ALT_INV_inB[1]~input_o\ <= NOT \inB[1]~input_o\;
\ALT_INV_inA[1]~input_o\ <= NOT \inA[1]~input_o\;
\ALT_INV_Cin~input_o\ <= NOT \Cin~input_o\;
\ALT_INV_inB[0]~input_o\ <= NOT \inB[0]~input_o\;
\ALT_INV_inA[0]~input_o\ <= NOT \inA[0]~input_o\;
\conv|ALT_INV_Mux6~0_combout\ <= NOT \conv|Mux6~0_combout\;
\S3|ALT_INV_Sum1~combout\ <= NOT \S3|Sum1~combout\;

-- Location: IOOBUF_X4_Y0_N19
\Sum4[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \conv|ALT_INV_Mux6~0_combout\,
	devoe => ww_devoe,
	o => ww_Sum4(0));

-- Location: IOOBUF_X6_Y0_N53
\Sum4[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \conv|Mux5~0_combout\,
	devoe => ww_devoe,
	o => ww_Sum4(1));

-- Location: IOOBUF_X8_Y0_N53
\Sum4[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \conv|Mux4~0_combout\,
	devoe => ww_devoe,
	o => ww_Sum4(2));

-- Location: IOOBUF_X6_Y0_N19
\Sum4[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \conv|Mux3~0_combout\,
	devoe => ww_devoe,
	o => ww_Sum4(3));

-- Location: IOOBUF_X4_Y0_N36
\Sum4[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \conv|Mux2~0_combout\,
	devoe => ww_devoe,
	o => ww_Sum4(4));

-- Location: IOOBUF_X8_Y0_N19
\Sum4[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \conv|Mux1~0_combout\,
	devoe => ww_devoe,
	o => ww_Sum4(5));

-- Location: IOOBUF_X6_Y0_N36
\Sum4[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \conv|Mux0~0_combout\,
	devoe => ww_devoe,
	o => ww_Sum4(6));

-- Location: IOOBUF_X4_Y0_N2
\Cout~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \S3|Cout~0_combout\,
	devoe => ww_devoe,
	o => ww_Cout);

-- Location: IOIBUF_X12_Y0_N18
\Cin~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Cin,
	o => \Cin~input_o\);

-- Location: IOIBUF_X10_Y0_N92
\inA[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_inA(0),
	o => \inA[0]~input_o\);

-- Location: IOIBUF_X14_Y0_N1
\inB[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_inB(0),
	o => \inB[0]~input_o\);

-- Location: LABCELL_X7_Y1_N0
\S0|Sum1\ : cyclonev_lcell_comb
-- Equation(s):
-- \S0|Sum1~combout\ = ( \inA[0]~input_o\ & ( \inB[0]~input_o\ & ( \Cin~input_o\ ) ) ) # ( !\inA[0]~input_o\ & ( \inB[0]~input_o\ & ( !\Cin~input_o\ ) ) ) # ( \inA[0]~input_o\ & ( !\inB[0]~input_o\ & ( !\Cin~input_o\ ) ) ) # ( !\inA[0]~input_o\ & ( 
-- !\inB[0]~input_o\ & ( \Cin~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111111100001111000011110000111100000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Cin~input_o\,
	datae => \ALT_INV_inA[0]~input_o\,
	dataf => \ALT_INV_inB[0]~input_o\,
	combout => \S0|Sum1~combout\);

-- Location: IOIBUF_X6_Y0_N1
\inA[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_inA(1),
	o => \inA[1]~input_o\);

-- Location: IOIBUF_X10_Y0_N41
\inB[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_inB(1),
	o => \inB[1]~input_o\);

-- Location: LABCELL_X7_Y1_N39
\S1|Sum1\ : cyclonev_lcell_comb
-- Equation(s):
-- \S1|Sum1~combout\ = ( \inB[1]~input_o\ & ( \inB[0]~input_o\ & ( !\inA[1]~input_o\ $ (((\inA[0]~input_o\) # (\Cin~input_o\))) ) ) ) # ( !\inB[1]~input_o\ & ( \inB[0]~input_o\ & ( !\inA[1]~input_o\ $ (((!\Cin~input_o\ & !\inA[0]~input_o\))) ) ) ) # ( 
-- \inB[1]~input_o\ & ( !\inB[0]~input_o\ & ( !\inA[1]~input_o\ $ (((\Cin~input_o\ & \inA[0]~input_o\))) ) ) ) # ( !\inB[1]~input_o\ & ( !\inB[0]~input_o\ & ( !\inA[1]~input_o\ $ (((!\Cin~input_o\) # (!\inA[0]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111101011010111100001010010101011010111100001010010100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Cin~input_o\,
	datac => \ALT_INV_inA[1]~input_o\,
	datad => \ALT_INV_inA[0]~input_o\,
	datae => \ALT_INV_inB[1]~input_o\,
	dataf => \ALT_INV_inB[0]~input_o\,
	combout => \S1|Sum1~combout\);

-- Location: LABCELL_X7_Y1_N42
\S1|Cout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \S1|Cout~0_combout\ = ( \inB[1]~input_o\ & ( \inB[0]~input_o\ & ( ((\Cin~input_o\) # (\inA[1]~input_o\)) # (\inA[0]~input_o\) ) ) ) # ( !\inB[1]~input_o\ & ( \inB[0]~input_o\ & ( (\inA[1]~input_o\ & ((\Cin~input_o\) # (\inA[0]~input_o\))) ) ) ) # ( 
-- \inB[1]~input_o\ & ( !\inB[0]~input_o\ & ( ((\inA[0]~input_o\ & \Cin~input_o\)) # (\inA[1]~input_o\) ) ) ) # ( !\inB[1]~input_o\ & ( !\inB[0]~input_o\ & ( (\inA[0]~input_o\ & (\inA[1]~input_o\ & \Cin~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001001101110011011100010011000100110111111101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_inA[0]~input_o\,
	datab => \ALT_INV_inA[1]~input_o\,
	datac => \ALT_INV_Cin~input_o\,
	datae => \ALT_INV_inB[1]~input_o\,
	dataf => \ALT_INV_inB[0]~input_o\,
	combout => \S1|Cout~0_combout\);

-- Location: IOIBUF_X10_Y0_N58
\inB[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_inB(3),
	o => \inB[3]~input_o\);

-- Location: IOIBUF_X8_Y0_N35
\inA[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_inA(3),
	o => \inA[3]~input_o\);

-- Location: IOIBUF_X8_Y0_N1
\inB[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_inB(2),
	o => \inB[2]~input_o\);

-- Location: IOIBUF_X10_Y0_N75
\inA[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_inA(2),
	o => \inA[2]~input_o\);

-- Location: LABCELL_X7_Y1_N54
\S3|Sum1\ : cyclonev_lcell_comb
-- Equation(s):
-- \S3|Sum1~combout\ = ( \inB[2]~input_o\ & ( \inA[2]~input_o\ & ( !\inB[3]~input_o\ $ (\inA[3]~input_o\) ) ) ) # ( !\inB[2]~input_o\ & ( \inA[2]~input_o\ & ( !\S1|Cout~0_combout\ $ (!\inB[3]~input_o\ $ (\inA[3]~input_o\)) ) ) ) # ( \inB[2]~input_o\ & ( 
-- !\inA[2]~input_o\ & ( !\S1|Cout~0_combout\ $ (!\inB[3]~input_o\ $ (\inA[3]~input_o\)) ) ) ) # ( !\inB[2]~input_o\ & ( !\inA[2]~input_o\ & ( !\inB[3]~input_o\ $ (!\inA[3]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111110000001111001100001100111100110000111111000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \S1|ALT_INV_Cout~0_combout\,
	datac => \ALT_INV_inB[3]~input_o\,
	datad => \ALT_INV_inA[3]~input_o\,
	datae => \ALT_INV_inB[2]~input_o\,
	dataf => \ALT_INV_inA[2]~input_o\,
	combout => \S3|Sum1~combout\);

-- Location: LABCELL_X7_Y1_N21
\S2|Sum1\ : cyclonev_lcell_comb
-- Equation(s):
-- \S2|Sum1~combout\ = ( \inB[2]~input_o\ & ( \inA[2]~input_o\ & ( \S1|Cout~0_combout\ ) ) ) # ( !\inB[2]~input_o\ & ( \inA[2]~input_o\ & ( !\S1|Cout~0_combout\ ) ) ) # ( \inB[2]~input_o\ & ( !\inA[2]~input_o\ & ( !\S1|Cout~0_combout\ ) ) ) # ( 
-- !\inB[2]~input_o\ & ( !\inA[2]~input_o\ & ( \S1|Cout~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111111100001111000011110000111100000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \S1|ALT_INV_Cout~0_combout\,
	datae => \ALT_INV_inB[2]~input_o\,
	dataf => \ALT_INV_inA[2]~input_o\,
	combout => \S2|Sum1~combout\);

-- Location: LABCELL_X7_Y1_N30
\conv|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv|Mux6~0_combout\ = ( \S2|Sum1~combout\ & ( (!\S0|Sum1~combout\ & ((!\S3|Sum1~combout\) # (\S1|Sum1~combout\))) # (\S0|Sum1~combout\ & ((!\S1|Sum1~combout\) # (\S3|Sum1~combout\))) ) ) # ( !\S2|Sum1~combout\ & ( (\S3|Sum1~combout\) # 
-- (\S1|Sum1~combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011111100111111001111110011111111100111111001111110011111100111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \S0|ALT_INV_Sum1~combout\,
	datab => \S1|ALT_INV_Sum1~combout\,
	datac => \S3|ALT_INV_Sum1~combout\,
	dataf => \S2|ALT_INV_Sum1~combout\,
	combout => \conv|Mux6~0_combout\);

-- Location: LABCELL_X7_Y1_N33
\conv|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv|Mux5~0_combout\ = ( \S2|Sum1~combout\ & ( (\S0|Sum1~combout\ & (!\S1|Sum1~combout\ $ (!\S3|Sum1~combout\))) ) ) # ( !\S2|Sum1~combout\ & ( (!\S3|Sum1~combout\ & ((\S1|Sum1~combout\) # (\S0|Sum1~combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111011100000000011101110000000000010001010001000001000101000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \S0|ALT_INV_Sum1~combout\,
	datab => \S1|ALT_INV_Sum1~combout\,
	datad => \S3|ALT_INV_Sum1~combout\,
	dataf => \S2|ALT_INV_Sum1~combout\,
	combout => \conv|Mux5~0_combout\);

-- Location: LABCELL_X7_Y1_N6
\conv|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv|Mux4~0_combout\ = ( \S2|Sum1~combout\ & ( (!\S3|Sum1~combout\ & ((!\S1|Sum1~combout\) # (\S0|Sum1~combout\))) ) ) # ( !\S2|Sum1~combout\ & ( (\S0|Sum1~combout\ & ((!\S1|Sum1~combout\) # (!\S3|Sum1~combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001100000011110000110011001111000000001100111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \S1|ALT_INV_Sum1~combout\,
	datac => \S0|ALT_INV_Sum1~combout\,
	datad => \S3|ALT_INV_Sum1~combout\,
	dataf => \S2|ALT_INV_Sum1~combout\,
	combout => \conv|Mux4~0_combout\);

-- Location: LABCELL_X7_Y1_N9
\conv|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv|Mux3~0_combout\ = ( \S2|Sum1~combout\ & ( (!\S0|Sum1~combout\ & (!\S1|Sum1~combout\ & !\S3|Sum1~combout\)) # (\S0|Sum1~combout\ & (\S1|Sum1~combout\)) ) ) # ( !\S2|Sum1~combout\ & ( (!\S0|Sum1~combout\ & (\S1|Sum1~combout\ & \S3|Sum1~combout\)) # 
-- (\S0|Sum1~combout\ & (!\S1|Sum1~combout\ & !\S3|Sum1~combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010000100010010001000010001010011001000100011001100100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \S0|ALT_INV_Sum1~combout\,
	datab => \S1|ALT_INV_Sum1~combout\,
	datad => \S3|ALT_INV_Sum1~combout\,
	dataf => \S2|ALT_INV_Sum1~combout\,
	combout => \conv|Mux3~0_combout\);

-- Location: LABCELL_X7_Y1_N12
\conv|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv|Mux2~0_combout\ = ( \S2|Sum1~combout\ & ( (\S3|Sum1~combout\ & ((!\S0|Sum1~combout\) # (\S1|Sum1~combout\))) ) ) # ( !\S2|Sum1~combout\ & ( (\S1|Sum1~combout\ & (!\S0|Sum1~combout\ & !\S3|Sum1~combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000000000001100000000000000000000111100110000000011110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \S1|ALT_INV_Sum1~combout\,
	datac => \S0|ALT_INV_Sum1~combout\,
	datad => \S3|ALT_INV_Sum1~combout\,
	dataf => \S2|ALT_INV_Sum1~combout\,
	combout => \conv|Mux2~0_combout\);

-- Location: LABCELL_X7_Y1_N15
\conv|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv|Mux1~0_combout\ = ( \S2|Sum1~combout\ & ( (!\S0|Sum1~combout\ & ((\S3|Sum1~combout\) # (\S1|Sum1~combout\))) # (\S0|Sum1~combout\ & (!\S1|Sum1~combout\ $ (\S3|Sum1~combout\))) ) ) # ( !\S2|Sum1~combout\ & ( (\S0|Sum1~combout\ & (\S1|Sum1~combout\ & 
-- \S3|Sum1~combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010001000000000001000101100110101110110110011010111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \S0|ALT_INV_Sum1~combout\,
	datab => \S1|ALT_INV_Sum1~combout\,
	datad => \S3|ALT_INV_Sum1~combout\,
	dataf => \S2|ALT_INV_Sum1~combout\,
	combout => \conv|Mux1~0_combout\);

-- Location: LABCELL_X7_Y1_N48
\conv|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv|Mux0~0_combout\ = ( \S3|Sum1~combout\ & ( (\S0|Sum1~combout\ & (!\S1|Sum1~combout\ $ (!\S2|Sum1~combout\))) ) ) # ( !\S3|Sum1~combout\ & ( (!\S1|Sum1~combout\ & (!\S0|Sum1~combout\ $ (!\S2|Sum1~combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100100001001000000101000001010001001000010010000001010000010100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \S0|ALT_INV_Sum1~combout\,
	datab => \S1|ALT_INV_Sum1~combout\,
	datac => \S2|ALT_INV_Sum1~combout\,
	datae => \S3|ALT_INV_Sum1~combout\,
	combout => \conv|Mux0~0_combout\);

-- Location: LABCELL_X7_Y1_N27
\S3|Cout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \S3|Cout~0_combout\ = ( \inB[2]~input_o\ & ( \inA[2]~input_o\ & ( (\inA[3]~input_o\) # (\inB[3]~input_o\) ) ) ) # ( !\inB[2]~input_o\ & ( \inA[2]~input_o\ & ( (!\inB[3]~input_o\ & (\inA[3]~input_o\ & \S1|Cout~0_combout\)) # (\inB[3]~input_o\ & 
-- ((\S1|Cout~0_combout\) # (\inA[3]~input_o\))) ) ) ) # ( \inB[2]~input_o\ & ( !\inA[2]~input_o\ & ( (!\inB[3]~input_o\ & (\inA[3]~input_o\ & \S1|Cout~0_combout\)) # (\inB[3]~input_o\ & ((\S1|Cout~0_combout\) # (\inA[3]~input_o\))) ) ) ) # ( 
-- !\inB[2]~input_o\ & ( !\inA[2]~input_o\ & ( (\inB[3]~input_o\ & \inA[3]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000101110001011100010111000101110111011101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_inB[3]~input_o\,
	datab => \ALT_INV_inA[3]~input_o\,
	datac => \S1|ALT_INV_Cout~0_combout\,
	datae => \ALT_INV_inB[2]~input_o\,
	dataf => \ALT_INV_inA[2]~input_o\,
	combout => \S3|Cout~0_combout\);

-- Location: LABCELL_X37_Y79_N3
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


