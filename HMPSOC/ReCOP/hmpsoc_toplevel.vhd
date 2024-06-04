library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

library work;
use work.TdmaMinTypes.all;

entity hmpsoc_TopLevel is
	generic (
		ports : positive := 6
	);
	port (
		CLOCK_50      : in    std_logic;
		CLOCK2_50     : in    std_logic;
		CLOCK3_50     : in    std_logic;

		KEY           : in    std_logic_vector(3 downto 0);
		SW            : in    std_logic_vector(9 downto 0);
		LEDR          : out   std_logic_vector(9 downto 0);
		HEX0          : out   std_logic_vector(6 downto 0);
		HEX1          : out   std_logic_vector(6 downto 0);
		HEX2          : out   std_logic_vector(6 downto 0);
		HEX3          : out   std_logic_vector(6 downto 0);
		HEX4          : out   std_logic_vector(6 downto 0);
		HEX5          : out   std_logic_vector(6 downto 0);
		
		DPCR_v		  : out std_logic_vector(31 downto 0);
		operand		  : out std_logic_vector(15 downto 0);
		rxsel			  : out std_logic_vector(3 downto 0);
		rzsel			  : out std_logic_vector(3 downto 0);
		rxdata		  : out std_logic_vector(15 downto 0);
		rzdata		  : out std_logic_vector(15 downto 0);
		sop_v			  : out std_logic_vector(15 downto 0);
		sip_v			  : out std_logic_vector(15 downto 0);
		op1sel		  : out std_logic_vector(2 downto 0);
		op2sel		  : out std_logic_vector(2 downto 0);
		op1			  : out std_logic_vector(15 downto 0);
		op2			  : out std_logic_vector(15 downto 0);
		dmout_v		  : out std_logic_vector(15 downto 0);
		pm_v			  : out std_logic_vector(15 downto 0);
		pc_v			  : out std_logic_vector(15 downto 0);
		opcode		  : out std_logic_vector(5 downto 0);
		rfsel			  : out std_logic_vector(2 downto 0);
		
		send_data	  : out std_logic_vector(31 downto 0);
		send_addr	  : out std_logic_vector(7 downto 0);
		
		compAddr 	  : out std_logic_vector(7 downto 0)
		
	);
end entity;

architecture rtl of hmpsoc_TopLevel is

	signal clock : std_logic;

	signal send_port : tdma_min_ports(0 to ports-1);
	signal recv_port : tdma_min_ports(0 to ports-1);
	signal dpcr_test : std_logic_vector(31 downto 0);
	
	signal corWinSize : integer range 0 to 64;
	signal avgWinSize : integer range 0 to 64;
begin

	clock <= CLOCK_50;

	tdma_min : entity work.TdmaMin
	generic map (
		ports => ports
	)
	port map (
		clock => clock,
		sends => send_port,
		recvs => recv_port
	);

	asp_adc : entity work.AspAdc
	port map (
		clock => clock,
		reset => '0',
		adc_data_ready => OPEN,
		send  => send_port(0),
		recv  => recv_port(0)
	);

	asp_avg : entity work.AspAvg
	port map (
		clock => clock,
		send => send_port(1),
		recv => recv_port(1),
		foundConfig => LEDR(1),
		segOut => HEX5 -- FOR TESTING
	);
	
	asp_cor : entity work.AspCor
	port map (
		clock => clock,
		send => send_port(2),
		recv => recv_port(2),
		corrVal => open,
		packFound => LEDR(0),
		segOut => HEX4 -- FOR TESTING
	);
	
	asp_pd : entity work.PD_ASP
	port map (
		clk => clock,
		send => send_port(3),
		recv => recv_port(3) -- should be 3
	);
	
	-- nios : entity work.nios
--    port map (
--		clk => clock,
--		recv => recv_port(4)
--	);
	
	recop : entity work.recopTopLevel
	port map (
		clk => clock,
		reset => '0',
		SIP => "00000" & KEY(1) & SW, -- switches and buttons input
		DPCR => dpcr_test, -- config packet (internal signal)
		--CONF_ADDR => send_port(5).addr(3 downto 0),
		--LED_PARAM => LEDR(4 downto 0), -- output packet param
		LED_PARAM => open,
		LED_ID => LEDR(9 downto 5), -- output packet id

		Func => operand,
		IR_RX => rxsel,
		IR_RZ => rzsel,
		OP =>  opcode,
		Op1Sel =>  op1sel,
		Op2Sel =>  op2sel,
		OP_1 =>  op1,
		OP_2 =>  op2,
		PC =>  pc_v,
		PM_OUT =>  pm_v,
		REG_RX =>  rxdata,
		REG_RZ =>  rzdata,
		RFInputSel => rfsel,
		SIP_R =>  sip_v,
		SOP =>  sop_v,
		DMOut => dmout_v
	);
	
	addrCalculator : entity work.addrCalculator
	port map (
		dpcr_val => dpcr_test, -- takes output of recop
		add_in_1 => dpcr_test(30 downto 27), -- identifier in
		add_out => 	compAddr,	-- address of configured component- for testing
		dpcr_val_out => send_data,
		send => send_port(5)	-- send to NOC		
	);
	
	HEX0 <= SW(6 downto 0);

end architecture;
