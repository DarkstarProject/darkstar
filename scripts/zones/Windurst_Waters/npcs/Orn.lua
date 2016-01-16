-----------------------------------
--    Area: Windurst Waters
--    NPC:  Orn
--    @pos -68 -9 30 238
-----------------------------------

require("scripts/globals/settings");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    bookwormStatus = player:getQuestStatus(WINDURST,EARLY_BIRD_CATCHES_THE_BOOKWORM);
    
    if (bookwormStatus == QUEST_ACCEPTED and player:getVar("EARLY_BIRD_TRACK_BOOK") == 3) then
        player:startEvent(0x018f);
        
    elseif (bookwormStatus == QUEST_ACCEPTED and player:getVar("EARLY_BIRD_TRACK_BOOK") == 2) then
        player:startEvent(0x018e);
        
    elseif (bookwormStatus == QUEST_ACCEPTED and player:getVar("EARLY_BIRD_TRACK_BOOK") == 1) then
        player:startEvent(0x018c);
    
    elseif (bookwormStatus == QUEST_ACCEPTED and player:hasKeyItem(10) == true) then
        player:startEvent(0x018b);
        
    else
        player:startEvent(0x28c);
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
    
    if (csid == 0x018b) then
        player:setVar("EARLY_BIRD_TRACK_BOOK",1);
    elseif (csid == 0x018e) then
        player:setVar("EARLY_BIRD_TRACK_BOOK",3);
    end
    
end;