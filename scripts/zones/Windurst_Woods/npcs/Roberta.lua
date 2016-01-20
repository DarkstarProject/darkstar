-----------------------------------
--    Area: Windurst Woods
--    NPC:  Roberta
--    Working 100%
--     @zone 241
--  @pos 21 -4 -157
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
    local BlueRibbonBlues = player:getQuestStatus(WINDURST,BLUE_RIBBON_BLUES);
    if (BlueRibbonBlues == QUEST_ACCEPTED) then
        local blueRibbonProg = player:getVar("BlueRibbonBluesProg");
        
        if (blueRibbonProg >= 2 and player:hasItem(13569)) then
            player:startEvent(0x017c);
        elseif (player:hasItem(13569)) then
            player:startEvent(0x017b); 
        elseif (player:hasItem(13569) == false) then
            if (blueRibbonProg == 1 or blueRibbonProg == 3) then
                player:startEvent(0x0179,0,13569); -- replaces ribbon if lost
            elseif (blueRibbonProg < 1) then
                player:startEvent(0x0178,0,13569); --gives us ribbon
            end
        else
            player:startEvent(0x1b4);
        end
    
    else
        player:startEvent(0x1b4);
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
    if (csid == 0x0178 and option == 1 or csid == 0x0179 and option == 1) then
        if (player:getFreeSlotsCount() >= 1) then
            local blueRibbonProg = player:getVar("BlueRibbonBluesProg");
            if (blueRibbonProg < 1) then
                player:setVar("BlueRibbonBluesProg",1);
            elseif (blueRibbonProg == 3) then
                player:setVar("BlueRibbonBluesProg",4);
            end
            player:addItem(13569);
            player:messageSpecial(ITEM_OBTAINED,13569);
        else
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,13569);
        end
    end
end;



