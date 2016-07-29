-----------------------------------
-- Area: Riverne Site #A01
-- NPC:  Unstable Displacement
-- ENM Battlefield
-----------------------------------
package.loaded["scripts/zones/Riverne-Site_A01/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/Riverne-Site_A01/TextIDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
    player:messageSpecial(SPACE_SEEMS_DISTORTED);
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