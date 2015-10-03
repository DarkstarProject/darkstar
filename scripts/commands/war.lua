---------------------------------------------------------------------------------------------------
-- func: WAR Gear Purchase AF1/AF2/AF3
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
11988,40000, -- Fighter's Torque
16678,40000, -- Razor Axe
12511,60000, -- Fighter's Mask
12638,60000, -- Fighter's Lorica
13961,60000, -- Fighter's Mufflers
14214,60000, -- Fighter's Cuisses
14089,60000, -- Fighter's Calligae
-- AF+1
15225,100000, -- Fighter's Mask+1
14473,100000, -- Fighter's Lorica+1
14890,100000, -- Fighter's Mufflers+1
15561,100000, -- Fighter's Cuisses+1
15352,100000, -- Fighter's Calligae+1
-- Relic
15871,150000, -- Warrior's Stone
15072,180000, -- Warrior's Mask
15087,180000, -- Warrior's Lorica
15102,180000, -- Warrior's Mufflers
15117,180000, -- Warrior's Cuisses
15132,180000, -- Warrior's Calligae
-- Relic +1
15245,280000, -- Warrior's Mask+1
14500,280000, -- Warrior's Lorica+1
14909,280000, -- Warrior's Mufflers+1
15580,280000, -- Warrior's Cuisses+1
15665,280000, -- Warrior's Calligae+1
-- Relic +2
10650,380000, -- Warrior's Mask+2
10670,380000, -- Warrior's Lorica+2
10690,380000, -- Warrior's Mufflers+2
10710,380000, -- Warrior's Cuisses+2
10730,380000, -- Warrior's Calligae+2

	}
 
showShop(player, STATIC, stock);
end