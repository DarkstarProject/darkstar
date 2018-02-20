-----------------------------------
-- Area: Port Bastok
--  NPC: Evi
-- Starts Quests: Past Perfect (100%)
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Port_Bastok/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    PastPerfect = player:getQuestStatus(BASTOK,PAST_PERFECT);

    if (PastPerfect == QUEST_ACCEPTED and player:hasKeyItem(TATTERED_MISSION_ORDERS)) then
        player:startEvent(131);
    elseif (player:getFameLevel(BASTOK) >= 2 and player:getVar("PastPerfectVar") == 2) then
        player:startEvent(130);
    elseif (PastPerfect == QUEST_AVAILABLE) then
        player:startEvent(104);
    else
        player:startEvent(21);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID2: %u",csid);
    -- printf("RESULT2: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 104 and player:getVar("PastPerfectVar") == 0) then
        player:setVar("PastPerfectVar",1);
    elseif (csid == 130) then
        player:addQuest(BASTOK,PAST_PERFECT);
    elseif (csid == 131) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,12560);
        else
            if (player:addItem(12560)) then
                player:delKeyItem(TATTERED_MISSION_ORDERS);
                player:setVar("PastPerfectVar",0);
                player:messageSpecial(ITEM_OBTAINED,12560);
                player:addFame(BASTOK,110);
                player:completeQuest(BASTOK,PAST_PERFECT);
            end
        end
    end

end;
