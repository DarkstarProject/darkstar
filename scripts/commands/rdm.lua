---------------------------------------------------------------------------------------------------
-- func: RDM Gear Purchase AF1/AF2/AF3
-- auth: <Unknown> :: Modded by Tagban + Ninjistix
-- desc: Opens Shop for Job Specific gear.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player)
	
stock = {
-- AF1
11992,40000, -- Warlock Torque
16829,40000, -- Fencing Degen
12513,60000, -- Warlock Chapeau
12642,60000, -- Warlock Tabard
13965,60000, -- Warlock Gloves
14218,60000, -- Warlock Tights
14093,60000, -- Warlock Boots
-- AF+1
15229,100000, -- Warlock Chapeau+1
14477,100000, -- Warlock Tabard+1
14894,100000, -- Warlock Gloves+1
15565,100000, -- Warlock Tights+1
15356,100000, -- Warlock Boots+1
-- Relic
15873,150000, -- Duelist's Belt
15076,180000, -- Duelist's Chapeau
15091,180000, -- Duelist's Tabard
15106,180000, -- Duelist's Gloves
15121,180000, -- Duelist's Tights
15136,180000, -- Duelist's Boots
-- Relic +1
15249,280000, -- Duelist's Chapeau+1
14504,280000, -- Duelist's Tabard+1
14913,280000, -- Duelist's Gloves+1
15584,280000, -- Duelist's Tights+1
15669,280000, -- Duelist's Boots+1
-- Relic +2
10654,380000, -- Duelist's Chapeau+2
10674,380000, -- Duelist's Tabard+2
10694,380000, -- Duelist's Gloves+2
10714,380000, -- Duelist's Tights+2
10734,380000, -- Duelist's Boots+2
	}
 
showShop(player, STATIC, stock);
end