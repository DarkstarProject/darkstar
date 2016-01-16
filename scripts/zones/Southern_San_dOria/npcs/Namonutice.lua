-----------------------------------
--  Area: Southern San d'Oria
--  NPC: Namonutice
--  Fame Checker
--  @zone: 230
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)

end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(0x001f, player:getFame(SANDORIA));
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
 
 

