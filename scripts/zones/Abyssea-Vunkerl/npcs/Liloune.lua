-----------------------------------
--    Area: Abyssea_Vunkeral
--    NPC: Liloune
--    Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Abyssea-Vunkerl/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Abyssea-Vunkerl/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(0x044B);
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