---------------------------------------------------------------------------------------------------
-- func: SMN Gear Purchase AF1/AF2/AF3
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
12002,40000, -- Evoker's Torque
17532,40000, -- Kukulcan's Staff
12520,60000, -- Evoker's Horn
12650,60000, -- Evoker's Doublet
13975,60000, -- Evoker's Bracers
14228,60000, -- Evoker's Spats
14103,60000, -- Evoker's Pigaches
-- AF+1
15239,100000, -- Evoker's Horn+1
14487,100000, -- Evoker's Doublet+1
14904,100000, -- Evoker's Bracers+1
15575,100000, -- Evoker's Spats+1
15366,100000, -- Evoker's Pigaches+1
-- Relic
15484,150000, -- Summoner's Cape
15086,180000, -- Summoner's Horn
15101,180000, -- Summoner's Doublet
15116,180000, -- Summoner's Bracers
15131,180000, -- Summoner's Spats
15146,180000, -- Summoner's Pigaches
-- Relic +1
15259,280000, -- Summoner's Horn+1
14514,280000, -- Summoner's Doublet+1
14923,280000, -- Summoner's Bracers+1
15594,280000, -- Summoner's Spats+1
15679,280000, -- Summoner's Pigaches+1
-- Relic +2
10664,380000, -- Summoner's Horn+2
10684,380000, -- Summoner's Doublet+2
10704,380000, -- Summoner's Bracers+2
10724,380000, -- Summoner's Spats+2
10744,380000, -- Summoner's Pigaches+2
	}
 
showShop(player, STATIC, stock);
end