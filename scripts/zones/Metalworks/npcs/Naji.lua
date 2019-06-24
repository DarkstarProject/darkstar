-----------------------------------
-- Area: Metalworks
--  NPC: Naji
-- Involved in Quests: The doorman (finish), Riding on the Clouds
-- Involved in Mission: Bastok 6-2
-- !pos 64 -14 -4 237
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/globals/missions");
local ID = require("scripts/zones/Metalworks/IDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getVar("ridingOnTheClouds_2") == 6) then
        if (trade:hasItemQty(1127,1) and trade:getItemCount() == 1) then -- Trade Kindred seal
            player:setVar("ridingOnTheClouds_2",0);
            player:tradeComplete();
            player:addKeyItem(dsp.ki.SMILING_STONE);
            player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.SMILING_STONE);
        end
    end

end;

function onTrigger(player,npc)

    if (player:hasKeyItem(dsp.ki.YASINS_SWORD)) then -- The Doorman, WAR AF1
        player:startEvent(750);
    elseif (player:getCurrentMission(BASTOK) ~= dsp.mission.id.bastok.NONE) then
        local currentMission = player:getCurrentMission(BASTOK);

        if (currentMission == dsp.mission.id.bastok.THE_ZERUHN_REPORT and player:hasKeyItem(dsp.ki.ZERUHN_REPORT)) then
            if (player:seenKeyItem(dsp.ki.ZERUHN_REPORT)) then
                player:startEvent(710,0);
            else
                player:startEvent(710,1);
            end
        elseif (currentMission == dsp.mission.id.bastok.THE_CRYSTAL_LINE and player:hasKeyItem(dsp.ki.C_L_REPORTS)) then
            player:startEvent(711);
        elseif (currentMission == dsp.mission.id.bastok.THE_EMISSARY and player:hasKeyItem(dsp.ki.KINDRED_REPORT)) then
            player:startEvent(714);
        elseif (currentMission == dsp.mission.id.bastok.THE_EMISSARY) then
            if (player:hasKeyItem(dsp.ki.LETTER_TO_THE_CONSULS_BASTOK) == false and player:getVar("MissionStatus") == 0) then
                player:startEvent(713);
            else
                player:showText(npc,ID.text.GOOD_LUCK);
            end
        elseif (player:hasKeyItem(dsp.ki.MESSAGE_TO_JEUNO_BASTOK) and player:getVar("MissionStatus") == 0) then
            player:startEvent(720);
        elseif (currentMission == dsp.mission.id.bastok.DARKNESS_RISING and player:getVar("MissionStatus") == 1) then
            player:startEvent(721);
        elseif (player:hasKeyItem(dsp.ki.BURNT_SEAL)) then
            player:startEvent(722);
        elseif (currentMission == dsp.mission.id.bastok.THE_PIRATE_S_COVE and player:getVar("MissionStatus") == 0) then
            player:startEvent(761);
        elseif (currentMission == dsp.mission.id.bastok.THE_PIRATE_S_COVE and player:getVar("MissionStatus") == 3) then
            player:startEvent(762);
        else
            player:startEvent(700);
        end
    elseif (player:hasKeyItem(dsp.ki.YASINS_SWORD)) then -- The Doorman
        player:startEvent(750);
    else
        player:startEvent(700);
    end

end;

-- 710  711  700  713  714  715  717  720  721  750  1008  1009  761
-- 762  782  805  845  877  938  939  940  941  942  971  969  970
function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 750) then
        if (player:getFreeSlotsCount(0) >= 1) then
            player:addItem(16678);
            player:messageSpecial(ID.text.ITEM_OBTAINED, 16678); -- Razor Axe
            player:delKeyItem(dsp.ki.YASINS_SWORD);
            player:setVar("theDoormanCS",0);
            player:addFame(BASTOK,30);
            player:completeQuest(BASTOK,dsp.quest.id.bastok.THE_DOORMAN);
        else
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 16678); -- Razor Axe
        end
    elseif (csid == 710) then
        player:delKeyItem(dsp.ki.ZERUHN_REPORT);
        player:completeMission(BASTOK,dsp.mission.id.bastok.THE_ZERUHN_REPORT);
    elseif (csid == 713) then
        player:addKeyItem(dsp.ki.LETTER_TO_THE_CONSULS_BASTOK);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.LETTER_TO_THE_CONSULS_BASTOK);
        player:setVar("MissionStatus",1);
    elseif (csid == 720 and option == 0 or csid == 721) then
        player:delKeyItem(dsp.ki.MESSAGE_TO_JEUNO_BASTOK);
        player:addKeyItem(dsp.ki.NEW_FEIYIN_SEAL);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.NEW_FEIYIN_SEAL);
        player:setVar("MissionStatus",10);
    elseif (csid == 720 and option == 1) then
        player:delKeyItem(dsp.ki.MESSAGE_TO_JEUNO_BASTOK);
        player:setVar("MissionStatus",1);
    elseif (csid == 761) then
        player:setVar("MissionStatus",1);
    elseif (csid == 714 or csid == 722 or csid == 762) then
        finishMissionTimeline(player,1,csid,option);
    end

end;