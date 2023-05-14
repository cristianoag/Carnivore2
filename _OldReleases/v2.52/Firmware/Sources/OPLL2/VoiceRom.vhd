-- 
-- VoiceRom.vhd 
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use WORK.VM2413.ALL;

entity VoiceRom is 
  port (  
    clk    : in std_logic;
    addr : in VOICE_ID_TYPE;
    data  : out VOICE_TYPE
  );
end VoiceRom;

architecture RTL of VoiceRom is

  type VOICE_ARRAY_TYPE is array (VOICE_ID_TYPE'range) of VOICE_VECTOR_TYPE;
  constant voices : VOICE_ARRAY_TYPE := (
-- APEK<ML>KL< TL >W<F><AR><DR><SL><RR>
  "000000000000000000000000000000000000", -- @0(M)
  "000000000000000000000000000000000000", -- @0(C)
-- APEK<ML>KL< TL >W<F><AR><DR><SL><RR>
  "011000010001111001111111000000000000", -- @1(M)
  "011000010000000010000111111100010111", -- @1(C)
-- APEK<ML>KL< TL >W<F><AR><DR><SL><RR>
  "000100110001011111101111111100100011", -- @2(M)
  "010000010000000000001111111100010011", -- @2(C)
-- APEK<ML>KL< TL >W<F><AR><DR><SL><RR>
  "001000111001101001001010001111110000", -- @3(M)
  "000000010000000000001111010000100011", -- @3(C)
-- APEK<ML>KL< TL >W<F><AR><DR><SL><RR>
  "000100010000111001111111101001110000", -- @4(M)
  "011000010000000000000110010000010111", -- @4(C)
-- APEK<ML>KL< TL >W<F><AR><DR><SL><RR>
  "001000100001111001101111000000000000", -- @5(M)
  "001000010000000000000111011000101000", -- @5(C)
-- APEK<ML>KL< TL >W<F><AR><DR><SL><RR>
  "001000010001011001011111000000000000", -- @6(M)
  "001000100000000000000111000100011000", -- @6(C)
-- APEK<ML>KL< TL >W<F><AR><DR><SL><RR>
  "001000010001110101111000001000010000", -- @7(M)
  "011000010000000000001000000000000111", -- @7(C)
-- APEK<ML>KL< TL >W<F><AR><DR><SL><RR>
  "001000110010110101101001000000000000", -- @8(M)
  "001000010000000010001001000000000111", -- @8(C)
-- APEK<ML>KL< TL >W<F><AR><DR><SL><RR>
  "001000010001101101100110010000010000", -- @9(M)
  "001000010000000000000110010100010111", -- @9(C)
-- APEK<ML>KL< TL >W<F><AR><DR><SL><RR>
  "001000010000101110101000010101110000", -- @10(M)
  "001000010000000010001010000000000111", -- @10(C)
-- APEK<ML>KL< TL >W<F><AR><DR><SL><RR>
  "001000111000001100001111111100010000", -- @11(M)
  "000000010000000010001011000000000100", -- @11(C)
-- APEK<ML>KL< TL >W<F><AR><DR><SL><RR>
  "100101110010000001111111111100100010", -- @12(M)
  "110000010000000000001111111100010010", -- @12(C)
-- APEK<ML>KL< TL >W<F><AR><DR><SL><RR>
  "011000010000110001011101001001000000", -- @13(M)
  "000000000000000000001111011001000011", -- @13(C)
-- APEK<ML>KL< TL >W<F><AR><DR><SL><RR>
  "000000010101011000111111010000000011", -- @14(M)
  "000000010000000000001111000000000010", -- @14(C)
-- APEK<ML>KL< TL >W<F><AR><DR><SL><RR>
  "001000011000100100111111000111110000", -- @15(M)
  "010000010000000000001111010000100011", -- @15(C)
-- APEK<ML>KL< TL >W<F><AR><DR><SL><RR>
  "000001110001011000001101111111111111", -- BD(M)
  "001000010000000000001111100011111000", -- BD(C)
-- APEK<ML>KL< TL >W<F><AR><DR><SL><RR>
  "001100010000000000001111011111110111", -- HH
  "001100100000000000001111011111110111", -- SD
-- APEK<ML>KL< TL >W<F><AR><DR><SL><RR>
  "001001010000000000001111100011111000", -- TOM
  "000000010000000000001101110001010101"  -- CYM
);

begin

  process (clk) 

  begin
  
    if clk'event and clk = '1' then
	  data <= CONV_VOICE(voices(addr));
    end if;
    
  end process;

end RTL;