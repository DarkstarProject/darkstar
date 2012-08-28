-----------------------------------
-- Area: Gusgen Mines
-- NPC:  Lever A
-- @pos -4 -40.561 -54.199
-----------------------------------
package.loaded["scripts/zones/Gusgen_Mines/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Gusgen_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	--Designation: Door(db name), lever(db name)
	--A: 17580370(_5g2), 17580376(_5gc)
	--B: 17580369(_5g1), 17508375(_5gb)
	--C: 17580368(_5g0), 17508374(_5ga)
	--D: 17508373(_5g5), 17580379(_5gf)
	--E: 17580372(_5g4), 17580378(_5ge)
	--F: 17580371(_5g3), 17580377(_5gd)
	
	--local nID = npc:getID();
	--printf("id: %u", nID);
	GetNPCByID(17580368):setAnimation(9);--close door C
	GetNPCByID(17580369):setAnimation(9);--close door B
	GetNPCByID(17580370):setAnimation(8);--open door A
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;