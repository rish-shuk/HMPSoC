library verilog;
use verilog.vl_types.all;
entity AudioClock_audio_pll_0 is
    port(
        ref_clk_clk     : in     vl_logic;
        ref_reset_reset : in     vl_logic;
        audio_clk_clk   : out    vl_logic;
        reset_source_reset: out    vl_logic
    );
end AudioClock_audio_pll_0;
