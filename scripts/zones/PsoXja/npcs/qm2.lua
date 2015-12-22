-----------------------------------
-- Area:  Pso'xja
-- NPC:   ??? (qm2)
-- @pos -282.742 -3.600 -210.000 9
-----------------------------------
package.loaded["scripts/zones/PsoXja/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/PsoXja/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
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