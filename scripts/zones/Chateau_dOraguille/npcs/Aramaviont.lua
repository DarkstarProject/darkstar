-----------------------------------
-- Area: Chateau d'Oraguille
-- NPC: Aramaviont
-- Standard Info NPC
-----------------------------------


package.loaded["scripts/zones/Chateau_dOraguille/TextIDs"] = nil;
require("scripts/zones/Chateau_dOraguille/TextIDs");
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
player:startEvent(0x206);
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



