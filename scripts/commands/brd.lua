---------------------------------------------------------------------------------------------------
-- func: BRD Gear Purchase AF1/AF2/AF3
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
11997,40000, -- Choral Torque
16766,40000, -- Paper Knife
13857,60000, -- Choral Roundlet
12647,60000, -- Choral Justaucorps
13970,60000, -- Choral Cuffs
14223,60000, -- Choral Cannions
14098,60000, -- Choral Slippers
-- AF+1
15234,100000, -- Choral Roundlet+1
14482,100000, -- Choral Justaucorps+1
14899,100000, -- Choral Cuffs+1
15570,100000, -- Choral Cannions+1
15361,100000, -- Choral Slippers+1
-- Relic
15482,150000, -- Bard's Cape
15081,180000, -- Bard's Roundlet
15096,180000, -- Bard's Justaucorps
15111,180000, -- Bard's Cuffs
15126,180000, -- Bard's Cannions
15141,180000, -- Bard's Slippers
-- Relic +1
15254,280000, -- Bard's Roundlet+1
14509,280000, -- Bard's Justaucorps+1
14918,280000, -- Bard's Cuffs+1
15589,280000, -- Bard's Cannions+1
15674,280000, -- Bard's Slippers+1
-- Relic +2
10659,380000, -- Bard's Roundlet+2
10679,380000, -- Bard's Justaucorps+2
10699,380000, -- Bard's Cuffs+2
10719,380000, -- Bard's Cannions+2
10739,380000, -- Bard's Slippers+2

	}
 
showShop(player, STATIC, stock);
end