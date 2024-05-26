library verilog;
use verilog.vl_types.all;
entity altera_up_altpll is
    generic(
        OUTCLK0_MULT    : integer := 1;
        OUTCLK0_DIV     : integer := 1;
        OUTCLK1_MULT    : integer := 1;
        OUTCLK1_DIV     : integer := 1;
        OUTCLK2_MULT    : integer := 1;
        OUTCLK2_DIV     : integer := 1;
        PHASE_SHIFT     : integer := 0;
        DEVICE_FAMILY   : string  := "Cyclone IV"
    );
    port(
        refclk          : in     vl_logic;
        reset           : in     vl_logic;
        outclk0         : out    vl_logic;
        outclk1         : out    vl_logic;
        outclk2         : out    vl_logic;
        locked          : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of OUTCLK0_MULT : constant is 1;
    attribute mti_svvh_generic_type of OUTCLK0_DIV : constant is 1;
    attribute mti_svvh_generic_type of OUTCLK1_MULT : constant is 1;
    attribute mti_svvh_generic_type of OUTCLK1_DIV : constant is 1;
    attribute mti_svvh_generic_type of OUTCLK2_MULT : constant is 1;
    attribute mti_svvh_generic_type of OUTCLK2_DIV : constant is 1;
    attribute mti_svvh_generic_type of PHASE_SHIFT : constant is 1;
    attribute mti_svvh_generic_type of DEVICE_FAMILY : constant is 1;
end altera_up_altpll;
