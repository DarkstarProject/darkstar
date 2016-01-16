-----------------------------------
-- Area: Qufim Island
-- NPC:  Giant Footprint
-- Involved in quest: Regaining Trust
-- @pos 501 -11 354 126
-----------------------------------
package.loaded["scripts/zones/Qufim_Island/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Qufim_Island/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:messageSpecial(GIGANTIC_FOOTPRINT);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("updateRESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("finishRESULT: %u",option);
end;