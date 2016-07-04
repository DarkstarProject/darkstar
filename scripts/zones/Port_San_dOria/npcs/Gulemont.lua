-----------------------------------
-- Area: Port San d'Oria
--   NPC: Gulemont
--  Type: Quest Giver
-- @zone: 232
--  @pos -69 -5 -38
--
-- Starts and Finishes Quest: The Dismayed Customer
-----------------------------------
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/titles");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/zones/Port_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(SANDORIA, FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(532,1) == true and trade:getItemCount() == 1) then
            player:messageSpecial(FLYER_REFUSED);
        end;
    end;
    
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    theDismayedCustomer = player:getQuestStatus(SANDORIA, THE_DISMAYED_CUSTOMER);
    if (theDismayedCustomer == QUEST_ACCEPTED) then
        if (player:hasKeyItem(GULEMONTS_DOCUMENT) == true) then
            player:startEvent(0x025f);
        else
            player:startEvent(0x025e);
        end;
    elseif (theDismayedCustomer == QUEST_AVAILABLE and player:getQuestStatus(SANDORIA, A_TASTE_FOR_MEAT) == QUEST_COMPLETED) then 
        player:startEvent(0x025d);
    else
        player:startEvent(0x0251);
    end;
    
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    
    -- "The Dismayed Customer"
    if (csid == 0x025d and option == 0) then
        player:addQuest(SANDORIA, THE_DISMAYED_CUSTOMER);
        player:setVar("theDismayedCustomer", math.random(1,3));
    elseif (csid == 0x025f) then
        player:delKeyItem(GULEMONTS_DOCUMENT);
        player:addFame(SANDORIA,30);
        player:addTitle(LOST_CHILD_OFFICER);
        player:completeQuest(SANDORIA, THE_DISMAYED_CUSTOMER);
        player:addGil(560*GIL_RATE);
        player:messageSpecial(GIL_OBTAINED,560*GIL_RATE);
    end;
    
end;




