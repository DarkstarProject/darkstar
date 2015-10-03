--------------------------------------------------------------------------------------------------
-- func: Shop for Salvage Gear
-- auth: <Unknown> :: Modded by Hiro
-- desc: Opens Shop for Salvage Gear
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player)
   
stock = {
14969,500000, -- Usukane gote 
14554,500000, --  Usukane Haramaki
15633,500000, -- Usukane Hizayoroi
16092,500000, -- Usukane Somen
15719,500000, -- Usukane Sune-Ate
14965,500000, -- Skadi's Bazubands 
15629,500000, -- Skadi's Chausses
14550,500000, -- Skadi's Cuirie
15715,500000, -- Skadi's Jambeaux
16088,500000, -- Skadi's Visor
16100,500000, -- Morrigan's Coron 
14977,500000, -- Morrigan's Cuffs
15727,500000, --  Morrigan's Pgch
14562,500000, -- Morrigan's Robe 
15641,500000, -- Morrigan's Slops
14546,500000, -- Ares' Cuirass
15625,500000, -- Ares' Flanchard
14961,500000, -- Ares' Gauntlets
16084,500000, -- Ares' Mask
15711,500000, -- Ares' Sollerets
15723,500000, -- Marduk's Crackows
14973,500000, -- Marduk's Dastanas
14558,500000, -- Marduk's Jubbah
15637,500000, -- Marduk's Shalwar
16096,500000, -- Marduk's Tiara
		   
   }
 
showShop(player, STATIC, stock);
end