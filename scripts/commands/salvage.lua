---------------------------------------------------------------------------------------------------
-- func: Limbus Gear Purchase 
-- auth: <Unknown> :: Modded by Tagban + Ninjistix
-- desc: Opens Shop for Salvage gear. 
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player)
	
stock = {
-- Ares'
16084,550000, -- Ares' Mask
14546,550000, -- Ares' Cuirass
14961,550000, -- Ares' Gauntlets
15625,550000, -- Ares' Flanchard
15711,550000, -- Ares' Sollerets
-- Ares' +1
27648,950000, -- Ares' Mask
27788,950000, -- Ares' Cuirass
27928,950000, -- Ares' Gauntlets
28071,950000, -- Ares' Flanchard
28208,950000, -- Ares' Sollerets

-- Skadi's
16088,550000, -- Skadi's Visor
14550,550000, -- Skadi's Cuirie
14965,550000, -- Skadi's Bazubands
15629,550000, -- Skadi's Chausses
15715,550000, -- Skadi's Jambeaux
-- Skadi's +1
27649,950000, -- Skadi's Visor
27789,950000, -- Skadi's Cuirie
27929,950000, -- Skadi's Bazubands
28072,950000, -- Skadi's Chausses
28209,950000, -- Skadi's Jambeaux

-- Usukane
16092,550000, -- Usukane Somen
14554,550000, -- Usukane Haramaki
14969,550000, -- Usukane Gote
15633,550000, -- Usukane Hizayoroi
15719,550000, -- Usukane Sune-Ate
-- Usukane +1
27650,950000, -- Usukane Somen
27790,950000, -- Usukane Haramaki
27930,950000, -- Usukane Gote
28073,950000, -- Usukane Hizayoroi
28210,950000, -- Usukane Sune-Ate

-- Marduk's
16096,550000, -- Marduk's Tiara
14558,550000, -- Marduk's Jubbah
14973,550000, -- Marduk's Dastanas
15637,550000, -- Marduk's Shalwar
15723,550000, -- Marduk's Crackows
-- Marduk's +1
27651,950000, -- Marduk's Tiara
27791,950000, -- Marduk's Jubbah
27931,950000, -- Marduk's Dastanas
28074,950000, -- Marduk's Shalwar
28211,950000, -- Marduk's Crackows

-- Morrigan
16100,550000, -- Morrigan Coronal
14562,550000, -- Morrigan Robe
14977,550000, -- Morrigan Cuffs
15641,550000, -- Morrigan Slops
15727,550000, -- Morrigan Pigaches
-- Morrigan +1
27652,950000, -- Morrigan Coronal
27792,950000, -- Morrigan Robe
27932,950000, -- Morrigan Cuffs
28075,950000, -- Morrigan Slops
28212,950000, -- Morrigan Pigaches
	}
 
showShop(player, STATIC, stock);
end