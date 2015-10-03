---------------------------------------------------------------------------------------------------
-- func: Limbus Gear Purchase 
-- auth: <Unknown> :: Modded by Tagban + Ninjistix
-- desc: Opens Shop for 99 Limbus gear. 
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player)
	
stock = {
14488,500000,
15576,500000,
15661,500000,
14905,500000,
15240,500000,
15662,500000,
14906,500000,
14489,500000,
15577,500000,
15241,500000,
-- Shedir
10441,500000, -- Shedir Turban
10279,500000, -- Shedir Manteel
10323,500000, -- Shedir Gages
10329,500000, -- Shedir Seraweels
10370,500000, -- Shedir Crackows
-- Enif
10438,500000, -- Enif Zucchetto
10276,500000, -- Enif Corazza
10320,500000, -- Enif Manopolas
10326,500000, -- Enif Cosciales
10367,500000, -- Enif Gambieras
-- Adhara
10439,500000, -- Adhara Turban
10277,500000, -- Adhara Manteel
10321,500000, -- Adhara Gages
10327,500000, -- Adhara Seraweels
10368,500000, -- Adhara Crackows
-- Murzim
10440,500000, -- Murzim Zucchetto
10278,500000, -- Murzim Corazza
10328,500000, -- Murzim Manopolas
10322,500000, -- Murzim Cosciales
10369,500000, -- Murzim Gambieras
	}
 
showShop(player, STATIC, stock);
end