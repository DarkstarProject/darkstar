---------------------------------------------------------------------------------------------------
-- func: DRG Gear Purchase AF1/AF2/AF3
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
12001,40000, -- Drachen Torque
16887,40000, -- Peregrine
12519,60000, -- Drachen Armet
12649,60000, -- Drachen Mail
13974,60000, -- Drachen Finger Gauntlets
14227,60000, -- Drachen Brais
14102,60000, -- Drachen Greaves
-- AF+1
15238,100000, -- Drachen Armet+1
14486,100000, -- Drachen Mail+1
14903,100000, -- Drachen Finger Gauntlets+1
15574,100000, -- Drachen Brais+1
15365,100000, -- Drachen Greaves+1
-- Relic
15878,150000, -- Wyrm Belt
15085,180000, -- Wyrm Armet
15100,180000, -- Wyrm Mail
15115,180000, -- Wyrm Finger Gauntlets
15130,180000, -- Wyrm Brais
15145,180000, -- Wyrm Greaves
-- Relic +1
15258,280000, -- Wyrm Armet+1
14513,280000, -- Wyrm Mail+1
14922,280000, -- Wyrm Finger Gauntlets+1
15593,280000, -- Wyrm Brais+1
15678,280000, -- Wyrm Greaves+1
-- Relic +2
10663,380000, -- Wyrm Armet+2
10683,380000, -- Wyrm Mail+2
10703,380000, -- Wyrm Finger Gauntlets+2
10723,380000, -- Wyrm Brais+2
10743,380000, -- Wyrm Greaves+2
	}
 
showShop(player, STATIC, stock);
end