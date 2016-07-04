-----------------------------------
--  Area: Grauberg [S]
--  NPC:  Harvesting Point
-----------------------------------
package.loaded["scripts/zones/Grauberg_[S]/TextIDs"] = nil;
-------------------------------------

require("scripts/globals/harvesting");
require("scripts/zones/Grauberg_[S]/TextIDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
    startHarvesting(player,player:getZoneID(),npc,trade,0x0385);
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
    player:messageSpecial(HARVESTING_IS_POSSIBLE_HERE,1020);
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