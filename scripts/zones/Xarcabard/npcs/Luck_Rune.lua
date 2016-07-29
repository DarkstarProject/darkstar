-----------------------------------
--  Area: Xarcabard
--  NPC:  Luck Rune
--  Involved in Quest: Mhaura Fortune
--  @pos 576.117 -0.164 -16.935 112
-----------------------------------
package.loaded["scripts/zones/Xarcabard/TextIDs"] = nil;
-------------------------------------

require("scripts/zones/Xarcabard/TextIDs");

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