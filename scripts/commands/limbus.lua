---------------------------------------------------------------------------------------------------
-- func: Limbus Gear Purchase 
-- auth: <Unknown> :: Modded by Tagban + Ninjistix
-- desc: Opens Shop for Limbus gear. 
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player)
	
stock = {
-- Homan
15240,150000, -- Homan Zucchetto
14488,150000, -- Homan Corazza
14905,150000, -- Homan Manopolas
15576,150000, -- Homan Cosciales
15661,150000, -- Homan Gambieras
-- Nashira
15241,150000, -- Nashira Turban
14489,150000, -- Nashira Manteel
14906,150000, -- Nashira Gages
15577,150000, -- Nashira Seraweels
15662,150000, -- Nashira Crackows
-- Shedir
10441,250000, -- Shedir Turban
10279,250000, -- Shedir Manteel
10323,250000, -- Shedir Gages
10329,250000, -- Shedir Seraweels
10370,250000, -- Shedir Crackows
-- Enif
10438,250000, -- Enif Zucchetto
10276,250000, -- Enif Corazza
10320,250000, -- Enif Manopolas
10326,250000, -- Enif Cosciales
10367,250000, -- Enif Gambieras
-- Adhara
10439,250000, -- Adhara Turban
10277,250000, -- Adhara Manteel
10321,250000, -- Adhara Gages
10327,250000, -- Adhara Seraweels
10368,250000, -- Adhara Crackows
-- Murzim
10440,250000, -- Murzim Zucchetto
10278,250000, -- Murzim Corazza
10322,250000, -- Murzim Manopolas
10328,250000, -- Murzim Cosciales
10369,250000, -- Murzim Gambieras
	}
 
showShop(player, STATIC, stock);
end