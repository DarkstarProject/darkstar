---------------------------------------------------------------------------------------------------
-- func: BST Gear Purchase AF1/AF2/AF3
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
11996,40000, -- Beast Torque
16680,40000, -- Barbaroi Axe
12517,60000, -- Beast Helm
12646,60000, -- Beast Jackcoat
14958,60000, -- Beast Gloves
14222,60000, -- Beast Trousers
14097,60000, -- Beast Gaiters
-- AF+1
15233,100000, -- Beast Helm+1
14481,100000, -- Beast Jackcoat+1
14898,100000, -- Beast Gloves+1
15569,100000, -- Beast Trousers+1
15360,100000, -- Beast Gaiters+1
-- Relic
15875,150000, -- Monster Belt
15080,180000, -- Monster Helm
15095,180000, -- Monster Jackcoat
15110,180000, -- Monster Gloves
15125,180000, -- Monster Trousers
15140,180000, -- Monster Gaiters
-- Relic +1
15253,280000, -- Monster Helm+1
14508,280000, -- Monster Jackcoat+1
14917,280000, -- Monster Gloves+1
15588,280000, -- Monster Trousers+1
15673,280000, -- Monster Gaiters+1
-- Relic +2
10658,380000, -- Monster Helm+2
10678,380000, -- Monster Jackcoat+2
10698,380000, -- Monster Gloves+2
10718,380000, -- Monster Trousers+2
10738,380000, -- Monster Gaiters+2

	}
 
showShop(player, STATIC, stock);
end