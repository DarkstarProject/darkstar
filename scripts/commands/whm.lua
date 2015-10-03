---------------------------------------------------------------------------------------------------
-- func: WHM Gear Purchase AF1/AF2/AF3
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
11990,40000, -- Healer's Torque
17422,40000, -- Blessed Hammer
13855,60000, -- Healer's Cap
12640,60000, -- Healer's Briault
13963,60000, -- Healer's Mitts
14216,60000, -- Healer's Pantaloons
14091,60000, -- Healer's Duckbills
-- AF+1
15227,100000, -- Healer's Cap+1
14475,100000, -- Healer's Briault+1
14892,100000, -- Healer's Mitts+1
15563,100000, -- Healer's Pantaloons+1
15354,100000, -- Healer's Duckbills+1
-- Relic
15872,150000, -- Cleric's Belt
15074,180000, -- Cleric's Cap
15089,180000, -- Cleric's Briault
15104,180000, -- Cleric's Mitts
15119,180000, -- Cleric's Pantaloons
15134,180000, -- Cleric's Duckbills
-- Relic +1
15247,280000, -- Cleric's Cap+1
14502,280000, -- Cleric's Briault+1
14911,280000, -- Cleric's Mitts+1
15582,280000, -- Cleric's Pantaloons+1
15667,280000, -- Cleric's Duckbills+1
-- Relic +2
10652,380000, -- Cleric's Cap+2
10672,380000, -- Cleric's Briault+2
10692,380000, -- Cleric's Mitts+2
10712,380000, -- Cleric's Pantaloons+2
10732,380000, -- Cleric's Duckbills+2
	}
 
showShop(player, STATIC, stock);
end