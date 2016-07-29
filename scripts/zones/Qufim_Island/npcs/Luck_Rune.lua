-----------------------------------
--  Area: Qufim Island
--  NPC:  Luck Rune
--  Involved in Quest: Mhaura Fortune
--  @pos -612.948 12.573 461.963 126
-----------------------------------
package.loaded["scripts/zones/Qufim_Island/TextIDs"] = nil;
-------------------------------------

require("scripts/zones/Qufim_Island/TextIDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_OUT_OF_THE_ORDINARY);
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