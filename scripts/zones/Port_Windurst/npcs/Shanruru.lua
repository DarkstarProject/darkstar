-----------------------------------
-- Area: Port Windurst
--  NPC: Shanruru
-- Involved in Quest: Riding on the Clouds
-- @zone 240
-- !pos -1 -6 187
-----------------------------------
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Port_Windurst/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(JEUNO,RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getVar("ridingOnTheClouds_4") == 5) then
        if (trade:hasItemQty(1127,1) and trade:getItemCount() == 1) then -- Trade Kindred seal
            player:setVar("ridingOnTheClouds_4",0);
            player:tradeComplete();
            player:addKeyItem(SPIRITED_STONE);
            player:messageSpecial(KEYITEM_OBTAINED,SPIRITED_STONE);
        end
    end

end;

function onTrigger(player,npc)

    TruthJusticeOnionWay = player:getQuestStatus(WINDURST,TRUTH_JUSTICE_AND_THE_ONION_WAY);
    InspectorsGadget     = player:getQuestStatus(WINDURST,INSPECTOR_S_GADGET);
    OnionRings           = player:getQuestStatus(WINDURST,ONION_RINGS);

    if (player:getQuestStatus(WINDURST,THE_PROMISE) == QUEST_COMPLETED) then
        Message = math.random(0,1)

        if (Message == 1) then
            player:startEvent(529);
        else
            player:startEvent(541);
        end
    elseif (player:getQuestStatus(WINDURST,CRYING_OVER_ONIONS) == QUEST_ACCEPTED) then
        player:startEvent(504);
    elseif (OnionRings == QUEST_COMPLETED) then
        player:startEvent(446);
    elseif (OnionRings == QUEST_ACCEPTED ) then
        player:startEvent(439);
    elseif (InspectorsGadget == QUEST_COMPLETED) then
        player:startEvent(428);
    elseif (InspectorsGadget == QUEST_ACCEPTED) then
        player:startEvent(420);
    elseif (player:getQuestStatus(WINDURST,KNOW_ONE_S_ONIONS) == QUEST_COMPLETED) then
        player:startEvent(412);
    elseif (TruthJusticeOnionWay == QUEST_COMPLETED) then
        player:startEvent(384);
    elseif (TruthJusticeOnionWay == QUEST_ACCEPTED) then
        player:startEvent(377);
    else
        player:startEvent(367);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID2: %u",csid);
    -- printf("RESULT2: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;