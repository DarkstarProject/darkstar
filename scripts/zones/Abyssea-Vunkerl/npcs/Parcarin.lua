-----------------------------------
--    Area: Abyssea_Vunkeral
--    NPC: Parcarin
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
    player:startEvent(0x044C);
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