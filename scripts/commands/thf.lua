---------------------------------------------------------------------------------------------------
-- func: THF Gear Purchase AF1/AF2/AF3
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
11993,40000, --  Rogue's Torque
16764,40000, -- Marauder's Knife
12514,60000, --  Rogue's Bonnet
12643,60000, --  Rogue's Vest
13966,60000, --  Rogue's Armlets
14219,60000, --  Rogue's Culottes
14094,60000, --  Rogue's Poulaines
-- AF+1
15230,100000, --  Rogue's Bonnet+1
14478,100000, --  Rogue's Vest+1
14895,100000, --  Rogue's Armlets+1
15566,100000, --  Rogue's Culottes+1
15357,100000, --  Rogue's Poulaines+1
-- Relic
15480,150000, -- Assassin's Cape
15077,180000, -- Assassin's Bonnet
15092,180000, -- Assassin's Vest
15107,180000, -- Assassin's Armlets
15122,180000, -- Assassin's Culottes
15137,180000, -- Assassin's Poulaines
-- Relic +1
15250,280000, -- Assassin's Bonnet+1
14505,280000, -- Assassin's Vest+1
14914,280000, -- Assassin's Armlets+1
15585,280000, -- Assassin's Culottes+1
15670,280000, -- Assassin's Poulaines+1
-- Relic +2
10655,380000, -- Assassin's Bonnet+2
10675,380000, -- Assassin's Vest+2
10695,380000, -- Assassin's Armlets+2
10715,380000, -- Assassin's Culottes+2
10735,380000, -- Assassin's Poulaines+2
	}
 
showShop(player, STATIC, stock);
end