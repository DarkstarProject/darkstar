-----------------------------------
-- Area: Chateau d'Oraguille
-- Door: Prince Royal's
-- Finishes Quest: A Boy's Dream, Under Oath
-- Involved in Missions: 3-1, 5-2, 8-2
-- !pos -38 -3 73 233
-----------------------------------
package.loaded["scripts/zones/Chateau_dOraguille/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/globals/titles");
require("scripts/zones/Chateau_dOraguille/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

end;

function onTrigger(player,npc)

    local currentMission = player:getCurrentMission(SANDORIA);
    local MissionStatus = player:getVar("MissionStatus");
    local infiltrateDavoi = player:hasCompletedMission(SANDORIA,INFILTRATE_DAVOI);

    local Wait1DayRanperre = player:getVar("Wait1DayForRanperre_date");
    local osdate = tonumber(os.date("%j"));

    if (player:getVar("aBoysDreamCS") == 8) then
        player:startEvent(88);
    elseif (player:getQuestStatus(SANDORIA,A_BOY_S_DREAM) == QUEST_COMPLETED and player:getQuestStatus(SANDORIA,UNDER_OATH) == QUEST_AVAILABLE and player:getMainJob() == JOBS.PLD) then
        player:startEvent(90);
    elseif (player:getVar("UnderOathCS") == 8) then
        player:startEvent(89);
    elseif (currentMission == INFILTRATE_DAVOI and infiltrateDavoi == false and MissionStatus == 0) then
        player:startEvent(553,0,ROYAL_KNIGHTS_DAVOI_REPORT);
    elseif (currentMission == INFILTRATE_DAVOI and MissionStatus == 4) then
        player:startEvent(554,0,ROYAL_KNIGHTS_DAVOI_REPORT);
    elseif (currentMission == THE_SHADOW_LORD and MissionStatus == 1) then
        player:startEvent(547);
    elseif (currentMission == RANPERRE_S_FINAL_REST and MissionStatus == 0) then
        player:startEvent(81);
    elseif (CurrentMission == RANPERRE_S_FINAL_REST and MissionStatus == 4 and Wait1DayRanperre ~= osdate) then -- Ready now.
        player:startEvent(21);
    elseif (currentMission == RANPERRE_S_FINAL_REST and MissionStatus == 7) then
        player:startEvent(21);
    elseif (player:hasCompletedMission(SANDORIA,LIGHTBRINGER) and player:getRank() == 9 and player:getVar("Cutscenes_8-2") == 0) then
        player:startEvent(63);
    else
        player:startEvent(522);
    end

    return 1;

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 553) then
        player:setVar("MissionStatus",2);
    elseif (csid == 547) then
        player:setVar("MissionStatus",2);
    elseif (csid == 554) then
        finishMissionTimeline(player,3,csid,option);
    elseif (csid == 88) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,14095);
        else
            if (player:getMainJob() == JOBS.PLD) then
                player:addQuest(SANDORIA,UNDER_OATH);
            end
            player:delKeyItem(KNIGHTS_BOOTS);
            player:addItem(14095);
            player:messageSpecial(ITEM_OBTAINED,14095); -- Gallant Leggings
            player:setVar("aBoysDreamCS",0);
            player:addFame(SANDORIA,AF2_FAME);
            player:completeQuest(SANDORIA,A_BOY_S_DREAM);
        end
    elseif (csid == 90 and option ==1) then
        player:addQuest(SANDORIA,UNDER_OATH);
        player:setVar("UnderOathCS",0);
    elseif (csid == 89) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,12644);
        else
            player:addItem(12644);
            player:messageSpecial(ITEM_OBTAINED,12644); -- Gallant Surcoat
            player:setVar("UnderOathCS",9);
            player:addFame(SANDORIA,AF3_FAME);
            player:setTitle(PARAGON_OF_PALADIN_EXCELLENCE);
            player:completeQuest(SANDORIA,UNDER_OATH);
        end
    elseif (csid == 81) then
        player:setVar("MissionStatus",1);
    elseif (csid == 21) then
        player:setVar("Wait1DayForRanperre_date",0);
        player:setVar("MissionStatus",8);
    elseif (csid == 63) then
        player:setVar("Cutscenes_8-2",1)
    end

end;
