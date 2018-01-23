-----------------------------------
-- Area: Ru'Lude Gardens
--  NPC: Goggehn
-- Involved in Mission: Bastok 3-3, 4-1
-- @zone 243
-- !pos 3 9 -76
-----------------------------------
package.loaded["scripts/zones/RuLude_Gardens/TextIDs"] = nil;
package.loaded["scripts/globals/missions"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/RuLude_Gardens/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    pNation = player:getNation();
    currentMission = player:getCurrentMission(BASTOK);
    missionStatus = player:getVar("MissionStatus");

    if (currentMission == JEUNO_MISSION and missionStatus == 1) then
        player:startEvent(41);
    elseif (currentMission == JEUNO_MISSION and missionStatus == 2) then
        player:startEvent(66);
    elseif (currentMission == JEUNO_MISSION and missionStatus == 3) then
        player:startEvent(38);
    elseif (player:getRank() == 4 and player:getCurrentMission(BASTOK) == 255 and getMissionRankPoints(player,13) == 1) then
        if (player:hasKeyItem(ARCHDUCAL_AUDIENCE_PERMIT)) then
            player:startEvent(129,1);
        else
            player:startEvent(129); -- Start Mission 4-1 Magicite
        end
    elseif (currentMission == MAGICITE_BASTOK and missionStatus == 1) then
        player:startEvent(132);
    elseif (currentMission == MAGICITE_BASTOK and missionStatus <= 5) then
        player:startEvent(135);
    elseif (currentMission == MAGICITE_BASTOK and missionStatus == 6) then
        player:startEvent(35);
    elseif (player:hasKeyItem(MESSAGE_TO_JEUNO_BASTOK)) then
        player:startEvent(55);
    elseif (pNation == NATION_WINDURST) then
        player:startEvent(4);
    elseif (pNation == NATION_SANDORIA) then
        player:startEvent(2);
    else
        player:startEvent(101);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 41) then
        player:setVar("MissionStatus",2);
        player:delKeyItem(LETTER_TO_THE_AMBASSADOR);
    elseif (csid == 129 and option == 1) then
        player:setVar("MissionStatus",1);
        if (player:hasKeyItem(ARCHDUCAL_AUDIENCE_PERMIT) == false) then
            player:addKeyItem(ARCHDUCAL_AUDIENCE_PERMIT);
            player:messageSpecial(KEYITEM_OBTAINED,ARCHDUCAL_AUDIENCE_PERMIT);
        end
    elseif (csid == 38 or csid == 35) then
        finishMissionTimeline(player,1,csid,option);
    end

end;