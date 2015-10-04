---------------------------------------------------------------------------------------------------
-- func: MNK Gear Purchase AF1/AF2/AF3
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
11989,40000, -- Temple Torque
17478,40000, -- Beat Cesti
12512,60000, -- Temple Crown
12639,60000, -- Temple Cyclas
13962,60000, -- Temple Gloves
14215,60000, -- Temple Hose
14090,60000, -- Temple Gaiters
-- AF+1
15226,100000, -- Temple Crown+1
14474,100000, -- Temple Cyclas+1
14891,100000, -- Temple Gloves+1
15562,100000, -- Temple Hose+1
15353,100000, -- Temple Gaiters+1
-- Relic
15478,150000, -- Melee Cape
15073,180000, -- Melee Crown
15088,180000, -- Melee Cyclas
15103,180000, -- Melee Gloves
15118,180000, -- Melee Hose
15133,180000, -- Melee Gaiters
-- Relic +1
15246,280000, -- Melee Crown+1
14501,280000, -- Melee Cyclas+1
14910,280000, -- Melee Gloves+1
15581,280000, -- Melee Hose+1
15666,280000, -- Melee Gaiters+1
-- Relic +2
10651,380000, -- Melee Crown+2
10671,380000, -- Melee Cyclas+2
10691,380000, -- Melee Gloves+2
10711,380000, -- Melee Hose+2
10731,380000, -- Melee Gaiters+2
	}
 
showShop(player, STATIC, stock);
end