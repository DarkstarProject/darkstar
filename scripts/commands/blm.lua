---------------------------------------------------------------------------------------------------
-- func: BLM Gear Purchase AF1/AF2/AF3
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
11991,40000, -- Wizard's Torque
17423,40000, -- Casting Wand
13856,60000, -- Wizard's Petasos
12641,60000, -- Wizard's Coat
13964,60000, -- Wizard's Gloves
14217,60000, -- Wizard's Tonban
14092,60000, -- Wizard's Sabots
-- AF+1
15228,100000, -- Wizard's Petasos+1
14476,100000, -- Wizard's Coat+1
14893,100000, -- Wizard's Gloves+1
15564,100000, -- Wizard's Tonban+1
15355,100000, -- Wizard's Sabots+1
-- Relic
15874,150000, -- Sorcerer's Belt
15075,180000, -- Sorcerer's Petasos
15090,180000, -- Sorcerer's Coat
15105,180000, -- Sorcerer's Gloves
15120,180000, -- Sorcerer's Tonban
15135,180000, -- Sorcerer's Sabots
-- Relic +1
15248,280000, -- Sorcerer's Petasos+1
14503,280000, -- Sorcerer's Coat+1
14912,280000, -- Sorcerer's Gloves+1
15583,280000, -- Sorcerer's Tonban+1
15668,280000, -- Sorcerer's Sabots+1
-- Relic +2
10653,380000, -- Sorcerer's Petasos+2
10673,380000, -- Sorcerer's Coat+2
10693,380000, -- Sorcerer's Gloves+2
10713,380000, -- Sorcerer's Tonban+2
10733,380000, -- Sorcerer's Sabots+2

	}
 
showShop(player, STATIC, stock);
end