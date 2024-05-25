	component NOC is
		port (
			addr_pio_external_connection_in_port    : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- in_port
			addr_pio_external_connection_out_port   : out std_logic_vector(7 downto 0);                     -- out_port
			buttons_pio_external_connection_export  : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- export
			clk_clk                                 : in  std_logic                     := 'X';             -- clk
			data_pio_external_connection_in_port    : in  std_logic_vector(31 downto 0) := (others => 'X'); -- in_port
			data_pio_external_connection_out_port   : out std_logic_vector(31 downto 0);                    -- out_port
			display0_pio_external_connection_export : out std_logic_vector(6 downto 0);                     -- export
			display1_pio_external_connection_export : out std_logic_vector(6 downto 0);                     -- export
			display2_pio_external_connection_export : out std_logic_vector(6 downto 0);                     -- export
			display3_pio_external_connection_export : out std_logic_vector(6 downto 0);                     -- export
			display4_pio_external_connection_export : out std_logic_vector(6 downto 0);                     -- export
			display5_pio_external_connection_export : out std_logic_vector(6 downto 0);                     -- export
			led_pio_external_connection_export      : out std_logic_vector(9 downto 0);                     -- export
			reset_reset_n                           : in  std_logic                     := 'X';             -- reset_n
			switches_pio_external_connection_export : in  std_logic_vector(9 downto 0)  := (others => 'X')  -- export
		);
	end component NOC;

	u0 : component NOC
		port map (
			addr_pio_external_connection_in_port    => CONNECTED_TO_addr_pio_external_connection_in_port,    --     addr_pio_external_connection.in_port
			addr_pio_external_connection_out_port   => CONNECTED_TO_addr_pio_external_connection_out_port,   --                                 .out_port
			buttons_pio_external_connection_export  => CONNECTED_TO_buttons_pio_external_connection_export,  --  buttons_pio_external_connection.export
			clk_clk                                 => CONNECTED_TO_clk_clk,                                 --                              clk.clk
			data_pio_external_connection_in_port    => CONNECTED_TO_data_pio_external_connection_in_port,    --     data_pio_external_connection.in_port
			data_pio_external_connection_out_port   => CONNECTED_TO_data_pio_external_connection_out_port,   --                                 .out_port
			display0_pio_external_connection_export => CONNECTED_TO_display0_pio_external_connection_export, -- display0_pio_external_connection.export
			display1_pio_external_connection_export => CONNECTED_TO_display1_pio_external_connection_export, -- display1_pio_external_connection.export
			display2_pio_external_connection_export => CONNECTED_TO_display2_pio_external_connection_export, -- display2_pio_external_connection.export
			display3_pio_external_connection_export => CONNECTED_TO_display3_pio_external_connection_export, -- display3_pio_external_connection.export
			display4_pio_external_connection_export => CONNECTED_TO_display4_pio_external_connection_export, -- display4_pio_external_connection.export
			display5_pio_external_connection_export => CONNECTED_TO_display5_pio_external_connection_export, -- display5_pio_external_connection.export
			led_pio_external_connection_export      => CONNECTED_TO_led_pio_external_connection_export,      --      led_pio_external_connection.export
			reset_reset_n                           => CONNECTED_TO_reset_reset_n,                           --                            reset.reset_n
			switches_pio_external_connection_export => CONNECTED_TO_switches_pio_external_connection_export  -- switches_pio_external_connection.export
		);

