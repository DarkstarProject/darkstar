-----------------------------------
-- Area: Port Bastok
--  NPC: Hilda
-- Involved in Quest: Cid's Secret, Riding on the Clouds
-- Starts & Finishes: The Usual
-- !pos -163 -8 13 236
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/zones/Port_Bastok/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (trade:getGil() == 0 and trade:getItemCount() == 1) then
        if (trade:hasItemQty(4530,1) and player:getVar("CidsSecret_Event") == 1 and player:hasKeyItem(UNFINISHED_LETTER) == false) then -- Trade Rollanberry
            player:startEvent(133);
        elseif (trade:hasItemQty(4386,1) and player:getQuestStatus(BASTOK,THE_USUAL) == QUEST_ACCEPTED) then -- Trade King Truffle
            player:startEvent(135);
        end
    end

    if (player:getQuestStatus(JEUNO,RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getVar("ridingOnTheClouds_2") == 5) then
        if (trade:hasItemQty(1127,1) and trade:getItemCount() == 1) then -- Trade Kindred seal
            player:setVar("ridingOnTheClouds_2",0);
            player:tradeComplete();
            player:addKeyItem(SMILING_STONE);
            player:messageSpecial(KEYITEM_OBTAINED,SMILING_STONE);
        end
    end

end;

function onTrigger(player,npc)

    local WildcatBastok = player:getVar("WildcatBastok");

    if (player:getCurrentMission(BASTOK) == ON_MY_WAY) and (player:getVar("MissionStatus") == 1) then
        player:startEvent(255);
    elseif (player:getQuestStatus(BASTOK,LURE_OF_THE_WILDCAT_BASTOK) == QUEST_ACCEPTED and player:getMaskBit(WildcatBastok,3) == false) then
        player:startEvent(356);
    elseif (player:getQuestStatus(BASTOK,THE_USUAL) ~= QUEST_COMPLETED) then
        if (player:getQuestStatus(BASTOK,CID_S_SECRET) == QUEST_ACCEPTED) then
            player:startEvent(132);
            if (player:getVar("CidsSecret_Event") ~= 1) then
                player:setVar("CidsSecret_Event",1);
            end
        elseif (player:getFameLevel(BASTOK) >= 5 and player:getQuestStatus(BASTOK,CID_S_SECRET) == QUEST_COMPLETED) then
            if (player:getVar("TheUsual_Event") == 1) then
                player:startEvent(136);
            elseif (player:getQuestStatus(BASTOK,THE_USUAL) == QUEST_ACCEPTED) then
                player:startEvent(49); --Hilda thanks the player for all the help; there is no reminder dialogue for this quest
            else
                player:startEvent(134);
            end
        else
            player:startEvent(48); --Standard dialogue if fame isn't high enough to start The Usual and Cid's Secret is not active
        end
    elseif (player:getQuestStatus(BASTOK,THE_USUAL) == QUEST_COMPLETED and player:getQuestStatus(BASTOK,CID_S_SECRET) == QUEST_COMPLETED) then
        player:startEvent(49); --Hilda thanks the player for all the help
    else
        player:startEvent(48); --Standard dialogue if no quests are active or available
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 133) then
        player:tradeComplete();
        player:addKeyItem(UNFINISHED_LETTER);
        player:messageSpecial(KEYITEM_OBTAINED,UNFINISHED_LETTER);
    elseif (csid == 134 and option == 0) then
        if (player:getQuestStatus(BASTOK,THE_USUAL) == QUEST_AVAILABLE) then
            player:addQuest(BASTOK,THE_USUAL);
        end
    elseif (csid == 135) then
        player:tradeComplete();
        player:addKeyItem(STEAMING_SHEEP_INVITATION);
        player:messageSpecial(KEYITEM_OBTAINED,STEAMING_SHEEP_INVITATION);
    elseif (csid == 136) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,17170);
        else
            player:addTitle(STEAMING_SHEEP_REGULAR);
            player:delKeyItem(STEAMING_SHEEP_INVITATION);
            player:setVar("TheUsual_Event",0);
            player:addItem(17170);
            player:messageSpecial(ITEM_OBTAINED,17170); -- Speed Bow
            player:addFame(BASTOK,30);
            player:completeQuest(BASTOK,THE_USUAL);
        end
    elseif (csid == 255) then
        player:setVar("MissionStatus",2);
    elseif (csid == 356) then
        player:setMaskBit(player:getVar("WildcatBastok"),"WildcatBastok",3,true);
    end

end;