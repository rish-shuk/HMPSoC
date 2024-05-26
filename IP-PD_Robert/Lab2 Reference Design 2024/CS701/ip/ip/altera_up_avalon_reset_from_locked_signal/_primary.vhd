library verilog;
use verilog.vl_types.all;
entity altera_up_avalon_reset_from_locked_signal is
    port(
        locked          : in     vl_logic;
        reset           : out    vl_logic
    );
end altera_up_avalon_reset_from_locked_signal;
