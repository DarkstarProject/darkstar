---------------------------------------------------------------------------------------------------
-- func: DNC Gear Purchase AF1/AF2/AF3
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
-- AF1 Male
12006,40000, -- Dancer's Torque
19203,40000, -- War Hoop
16138,60000, -- Dancer's Tiara
14578,60000, -- Dancer's Casaque
15002,60000, -- Dancer's Bangles
15659,60000, -- Dancer's Tights
15746,60000, -- Dancer's Shoes
-- AF+1 Male
11475,100000, -- Dancer's Tiara+1
11302,100000, -- Dancer's Casaque+1
15035,100000, -- Dancer's Bangles+1
16357,100000, -- Dancer's Tights+1
11393,100000, -- Dancer's Shoes+1
-- AF1 Female
16139,60000, -- Dancer's Tiara
14579,60000, -- Dancer's Casaque
15003,60000, -- Dancer's Bangles
15660,60000, -- Dancer's Tights
15747,60000, -- Dancer's Shoes
-- AF+1 Female
11476,100000, -- Dancer's Tiara+1
11303,100000, -- Dancer's Casaque+1
15036,100000, -- Dancer's Bangles+1
16358,100000, -- Dancer's Tights+1
11394,100000, -- Dancer's Shoes+1
-- Relic
16248,150000, -- Etoile Cape
11478,180000, -- Etoile Tiara
11305,180000, -- Etoile Casaque
15038,180000, -- Etoile Bangles
16360,180000, -- Etoile Tights
11396,180000, -- Etoile Shoes
-- Relic +1
11479,280000, -- Etoile Tiara+1
11306,280000, -- Etoile Casaque+1
15039,280000, -- Etoile Bangles+1
16361,280000, -- Etoile Tights+1
11397,280000, -- Etoile Shoes+1
-- Relic +2
10668,380000, -- Etoile Tiara+2
10688,380000, -- Etoile Casaque+2
10708,380000, -- Etoile Bangles+2
10728,380000, -- Etoile Tights+2
10748,380000, -- Etoile Shoes+2
	}
 
showShop(player, STATIC, stock);
end