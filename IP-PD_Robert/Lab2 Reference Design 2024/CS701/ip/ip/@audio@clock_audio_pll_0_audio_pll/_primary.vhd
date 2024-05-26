library verilog;
use verilog.vl_types.all;
entity AudioClock_audio_pll_0_audio_pll is
    port(
        refclk          : in     vl_logic;
        rst             : in     vl_logic;
        outclk_0        : out    vl_logic;
        locked          : out    vl_logic
    );
end AudioClock_audio_pll_0_audio_pll;
