-----------------------------------
-- Area: Upper Jeuno
-- NPC:  Osker
-- Involved in Quest: Chocobo's Wounds
-----------------------------------
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/zones/Upper_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    local ANewDawnEvent = player:getVar("ANewDawn_Event");

    if (trade:hasItemQty(717,1) and trade:getItemCount() == 1 and ANewDawnEvent == 3) then
        player:tradeComplete();
        player:startEvent(0x0094);
    end
    
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local ANewDawn = player:getQuestStatus(JEUNO,A_NEW_DAWN);
    local ANewDawnEvent = player:getVar("ANewDawn_Event");

    local ChocobosWounds = player:getQuestStatus(JEUNO,CHOCOBO_S_WOUNDS);
    local feed = player:getVar("ChocobosWounds_Event");

    -- A New Dawn
    if (ANewDawn == QUEST_ACCEPTED) then
        if (ANewDawnEvent == 2 or ANewDawnEvent == 3) then
            player:startEvent(0x0092);
        elseif (ANewDawnEvent >= 4) then
            player:startEvent(0x0093);
        end
        
    -- Chocobos Wounds
    elseif (ChocobosWounds == 0) then
        player:startEvent(0x003e);
    elseif (ChocobosWounds == 1) then
        if (feed == 1) then
            player:startEvent(0x0067);
        elseif (feed == 2) then
            player:startEvent(0x0033);
        elseif (feed == 3) then
            player:startEvent(0x0034);
        elseif (feed == 4) then
            player:startEvent(0x003b);
        elseif (feed == 5) then
            player:startEvent(0x002e);
        elseif (feed == 6) then
            player:startEvent(0x0037);
        end
    elseif (ChocobosWounds == 2) then
        player:startEvent(0x0037);
        
    -- Standard Dialog 0036 probably isnt correct
    elseif (ANewDawn == QUEST_COMPLETED) then
        player:startEvent(0x0091);
    else
        player:startEvent(0x0036);
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

    local ANewDawnEvent = player:getVar("ANewDawn_Event");

    if (csid == 0x0092) then
        if (ANewDawnEvent == 2) then
            player:setVar("ANewDawn_Event",3);
        end
    elseif (csid == 0x0094) then
        player:addKeyItem(217); 
        player:messageSpecial(KEYITEM_OBTAINED, 217); 
        player:setVar("ANewDawn_Event",4);
    end
    
end;




