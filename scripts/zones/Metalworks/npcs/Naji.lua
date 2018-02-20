-----------------------------------
-- Area: Metalworks
--  NPC: Naji
-- Involved in Quests: The doorman (finish), Riding on the Clouds
-- Involved in Mission: Bastok 6-2
-- !pos 64 -14 -4 237
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/zones/Metalworks/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(JEUNO,RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getVar("ridingOnTheClouds_2") == 6) then
        if (trade:hasItemQty(1127,1) and trade:getItemCount() == 1) then -- Trade Kindred seal
            player:setVar("ridingOnTheClouds_2",0);
            player:tradeComplete();
            player:addKeyItem(SMILING_STONE);
            player:messageSpecial(KEYITEM_OBTAINED,SMILING_STONE);
        end
    end

end;

function onTrigger(player,npc)

    if (player:hasKeyItem(YASINS_SWORD)) then -- The Doorman, WAR AF1
        player:startEvent(750);
    elseif (player:getCurrentMission(BASTOK) ~= 255) then
        local currentMission = player:getCurrentMission(BASTOK);

        if (currentMission == THE_ZERUHN_REPORT and player:hasKeyItem(ZERUHN_REPORT)) then
            if (player:seenKeyItem(ZERUHN_REPORT)) then
                player:startEvent(710,0);
            else
                player:startEvent(710,1);
            end
        elseif (currentMission == THE_CRYSTAL_LINE and player:hasKeyItem(C_L_REPORTS)) then
            player:startEvent(711);
        elseif (currentMission == THE_EMISSARY and player:hasKeyItem(KINDRED_REPORT)) then
            player:startEvent(714);
        elseif (currentMission == THE_EMISSARY) then
            if (player:hasKeyItem(LETTER_TO_THE_CONSULS_BASTOK) == false and player:getVar("MissionStatus") == 0) then
                player:startEvent(713);
            else
                player:showText(npc,GOOD_LUCK);
            end
        elseif (player:hasKeyItem(MESSAGE_TO_JEUNO_BASTOK) and player:getVar("MissionStatus") == 0) then
            player:startEvent(720);
        elseif (currentMission == DARKNESS_RISING and player:getVar("MissionStatus") == 1) then
            player:startEvent(721);
        elseif (player:hasKeyItem(BURNT_SEAL)) then
            player:startEvent(722);
        elseif (currentMission == THE_PIRATE_S_COVE and player:getVar("MissionStatus") == 0) then
            player:startEvent(761);
        elseif (currentMission == THE_PIRATE_S_COVE and player:getVar("MissionStatus") == 3) then
            player:startEvent(762);
        else
            player:startEvent(700);
        end
    elseif (player:hasKeyItem(YASINS_SWORD)) then -- The Doorman
        player:startEvent(750);
    else
        player:startEvent(700);
    end

end;

-- 0x02c6  711  700  713  714  0x02cb  0x02cd  720  721  750  0x03f0  0x03f1  761
-- 762  0x030e  0x0325  0x034d  0x036d  0x03aa  0x03ab  0x03ac  0x03ad  0x03ae  0x03cb  0x03c9  0x03ca

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 750) then
        if (player:getFreeSlotsCount(0) >= 1) then
            player:addItem(16678);
            player:messageSpecial(ITEM_OBTAINED, 16678); -- Razor Axe
            player:delKeyItem(YASINS_SWORD);
            player:setVar("theDoormanCS",0);
            player:addFame(BASTOK,30);
            player:completeQuest(BASTOK,THE_DOORMAN);
        else
           player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 16678); -- Razor Axe
        end
    elseif (csid == 710) then
        player:delKeyItem(ZERUHN_REPORT);
        player:completeMission(BASTOK,THE_ZERUHN_REPORT);
    elseif (csid == 713) then
        player:addKeyItem(LETTER_TO_THE_CONSULS_BASTOK);
        player:messageSpecial(KEYITEM_OBTAINED,LETTER_TO_THE_CONSULS_BASTOK);
        player:setVar("MissionStatus",1);
    elseif (csid == 720 and option == 0 or csid == 721) then
        player:delKeyItem(MESSAGE_TO_JEUNO_BASTOK);
        player:addKeyItem(NEW_FEIYIN_SEAL);
        player:messageSpecial(KEYITEM_OBTAINED,NEW_FEIYIN_SEAL);
        player:setVar("MissionStatus",10);
    elseif (csid == 720 and option == 1) then
        player:delKeyItem(MESSAGE_TO_JEUNO_BASTOK);
        player:setVar("MissionStatus",1);
    elseif (csid == 761) then
        player:setVar("MissionStatus",1);
    elseif (csid == 714 or csid == 722 or csid == 762) then
        finishMissionTimeline(player,1,csid,option);
    end

end;