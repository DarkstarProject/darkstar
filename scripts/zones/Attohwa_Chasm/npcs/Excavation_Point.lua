-----------------------------------
--  Area: Attohwa Chasm
--  NPC:  Excavation Point
-----------------------------------
package.loaded["scripts/zones/Attohwa_Chasm/TextIDs"] = nil;
-------------------------------------

require("scripts/globals/excavation");
require("scripts/zones/Attohwa_Chasm/TextIDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
    startExcavation(player,player:getZoneID(),npc,trade,0x000A);
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