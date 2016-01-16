-----------------------------------
--    Area: Windurst Woods
--    NPC:  Matata
--  Type: Standard NPC
--  @zone: 241
--  @pos 131 -5 -109
--  Involved in quest: In a Stew
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/titles");
require("scripts/zones/Windurst_Woods/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    CB = player:getQuestStatus(WINDURST,CHOCOBILIOUS);
    IAS = player:getQuestStatus(WINDURST,IN_A_STEW);
    IASvar = player:getVar("IASvar");
    
    if (IAS == QUEST_ACCEPTED and IASvar == 1) then
        player:startEvent(0x00E9,0,0,4545); -- In a Stew in progress
    elseif (IAS == QUEST_ACCEPTED and IASvar == 2) then
        player:startEvent(0x00ED);             -- In a Stew reminder
    elseif (IAS == QUEST_COMPLETED) then
        player:startEvent(0x00F1);             -- new dialog after In a Stew
    
    elseif (CB == QUEST_COMPLETED) then
        player:startEvent(0x00E2); -- Chocobilious complete
    
    else
    -- Standard Dialog
    player:startEvent(0xdf);
    end
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
    
    -- In a Stew
    if (csid == 0x00E9) then
        player:setVar("IASvar",2);
    end
end;



