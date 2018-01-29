-----------------------------------
-- Area: Metalworks
--  NPC: Iron Eater
-- Involved in Missions
-- !pos 92.936 -19.532 1.814 237
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/missions");
require("scripts/zones/Metalworks/TextIDs");
require("scripts/globals/titles");
require("scripts/globals/settings");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local currentMission = player:getCurrentMission(BASTOK);
    local missionStatus = player:getVar("MissionStatus");

    if (currentMission == THE_FOUR_MUSKETEERS and missionStatus == 0) then -- Four Musketeers
        player:startEvent(715);
    elseif (currentMission == WHERE_TWO_PATHS_CONVERGE and player:getVar("BASTOK92") == 0) then
        player:startEvent(780);
    elseif (currentMission == WHERE_TWO_PATHS_CONVERGE and player:getVar("BASTOK92") == 2) then
        player:startEvent(782);
    elseif (player:getVar("Flagbastok") == 1) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,182);
        else
            player:setVar("Flagbastok",0);
            player:addItem(182);
            player:messageSpecial(ITEM_OBTAINED,182);
        end
    elseif (currentMission == THE_FOUR_MUSKETEERS and missionStatus == 1) then
        player:startEvent(716);
    elseif (currentMission == THE_CHAINS_THAT_BIND_US and missionStatus == 0) then
        player:startEvent(767); -- First cutscene of mission
    elseif (currentMission == THE_CHAINS_THAT_BIND_US) and (missionStatus == 2) then
        player:showText(npc, 8596); -- Dialogue after first cutscene
    elseif (currentMission == THE_CHAINS_THAT_BIND_US) and (missionStatus == 3) then
        player:startEvent(768); -- Cutscene on return from Quicksand Caves
    elseif (player:getQuestStatus(CRYSTAL_WAR,FIRES_OF_DISCONTENT) == QUEST_ACCEPTED) then
        if (player:getVar("FiresOfDiscProg") == 1) then
            player:startEvent(956);
        else
            player:startEvent(957);
        end
    else
        player:startEvent(604);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 715 and option == 0) then
        player:setVar("MissionStatus",1);
    elseif (csid == 780) then
        player:setVar("BASTOK92", 1);
    elseif (csid == 767 and option == 0) then
        player:setVar("MissionStatus", 1);
    elseif (csid == 768) then
        finishMissionTimeline(player, 1, csid, option);
    elseif (csid == 782) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,182);
            player:setVar("Flagbastok",1);
        else
            player:addItem(182);
            player:messageSpecial(ITEM_OBTAINED,182);
        end
        player:setVar("BASTOK92",0);
        player:completeMission(BASTOK,WHERE_TWO_PATHS_CONVERGE);
        player:setRank(10);
        player:addGil(GIL_RATE*100000);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*100000);
        player:setTitle(296);
    elseif (csid == 956) then
        player:setVar("FiresOfDiscProg",2);
    end
end;