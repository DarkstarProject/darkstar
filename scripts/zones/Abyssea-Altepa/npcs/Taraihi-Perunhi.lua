-----------------------------------
--    Area: Abyssea_Altepa
--    NPC: Taraihi-Perunhi
--    Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Abyssea-Altepa/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Abyssea-Altepa/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(0x014D);
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