-----------------------------------
-- Area: Port San d'Oria
--   NPC: Gulemont
-- Type: Quest Giver
-- @zone 232
-- !pos -69 -5 -38
--
-- Starts and Finishes Quest: The Dismayed Customer
-----------------------------------
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Port_San_dOria/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/titles");
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(SANDORIA, FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(532,1) == true and trade:getItemCount() == 1) then
            player:messageSpecial(FLYER_REFUSED);
        end;
    end;

end;

function onTrigger(player,npc)

    theDismayedCustomer = player:getQuestStatus(SANDORIA, THE_DISMAYED_CUSTOMER);
    if (theDismayedCustomer == QUEST_ACCEPTED) then
        if (player:hasKeyItem(GULEMONTS_DOCUMENT) == true) then
            player:startEvent(607);
        else
            player:startEvent(606);
        end;
    elseif (theDismayedCustomer == QUEST_AVAILABLE and player:getQuestStatus(SANDORIA, A_TASTE_FOR_MEAT) == QUEST_COMPLETED) then
        player:startEvent(605);
    else
        player:startEvent(593);
    end;

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    -- "The Dismayed Customer"
    if (csid == 605 and option == 0) then
        player:addQuest(SANDORIA, THE_DISMAYED_CUSTOMER);
        player:setVar("theDismayedCustomer", math.random(1,3));
    elseif (csid == 607) then
        player:delKeyItem(GULEMONTS_DOCUMENT);
        player:addFame(SANDORIA,30);
        player:addTitle(LOST_CHILD_OFFICER);
        player:completeQuest(SANDORIA, THE_DISMAYED_CUSTOMER);
        player:addGil(560*GIL_RATE);
        player:messageSpecial(GIL_OBTAINED,560*GIL_RATE);
    end;

end;
