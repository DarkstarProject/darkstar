-----------------------------------
--  Area: Oldton Movalpolos
--  NPC:  Excavation Point
-----------------------------------
package.loaded["scripts/zones/Oldton_Movalpolos/TextIDs"] = nil;
-------------------------------------

require("scripts/globals/excavation");
require("scripts/zones/Oldton_Movalpolos/TextIDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
	startExcavation(player,player:getZone(),npc,trade,0x0000);
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
	player:messageSpecial(MINING_IS_POSSIBLE_HERE,605);
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