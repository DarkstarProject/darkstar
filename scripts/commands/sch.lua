---------------------------------------------------------------------------------------------------
-- func: SCH Gear Purchase AF1/AF2/AF3
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
12007,40000, -- Scholar's Torque
6058,40000, -- Klimaform
16140,60000, -- Scholar's Mortarboard
14580,60000, -- Scholar's Gown
15004,60000, -- Scholar's Bracers
16311,60000, -- Scholar's Pants
15748,60000, -- Scholar's Loafers
-- AF+1
11477,100000, -- Scholar's Mortarboard+1
11304,100000, -- Scholar's Gown+1
15037,100000, -- Scholar's Bracers+1
16359,100000, -- Scholar's Pants+1
11395,100000, -- Scholar's Loafers+1
-- Relic
15925,150000, -- Argute Belt
11480,180000, -- Argute Mortarboard
11307,180000, -- Argute Gown
15040,180000, -- Argute Bracers
16362,180000, -- Argute Pants
11398,180000, -- Argute Loafers
-- Relic +1
11481,280000, -- Argute Mortarboard+1
11308,280000, -- Argute Gown+1
15041,280000, -- Argute Bracers+1
16363,280000, -- Argute Pants+1
11399,280000, -- Argute Loafers+1
-- Relic +2
10669,380000, -- Argute Mortarboard+2
10689,380000, -- Argute Gown+2
10709,380000, -- Argute Bracers+2
10729,380000, -- Argute Pants+2
10749,380000, -- Argute Loafers+2

	}
 
showShop(player, STATIC, stock);
end