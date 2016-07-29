-----------------------------------
--  Area: Carpenters Landing
--  NPC:  Logging Point
-----------------------------------
package.loaded["scripts/zones/Carpenters_Landing/TextIDs"] = nil;
-------------------------------------

require("scripts/globals/logging");
require("scripts/zones/Carpenters_Landing/TextIDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
    startLogging(player,player:getZoneID(),npc,trade,0x001E);
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
    player:messageSpecial(LOGGING_IS_POSSIBLE_HERE,1021);
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