-----------------------------------
-- Area: Port Windurst
--  NPC: Janshura Rashura
-- Starts Windurst Missions
-- !pos -227 -8 184 240
-----------------------------------
local ID = require("scripts/zones/Port_Windurst/IDs");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
-----------------------------------

function onTrigger(player,npc)

    if (player:getNation() ~= dsp.nation.WINDURST) then
        player:startEvent(71); -- for other nation
    else
        CurrentMission = player:getCurrentMission(WINDURST);
        MissionStatus = player:getCharVar("MissionStatus");
        pRank = player:getRank();
        cs, p, offset = getMissionOffset(player,3,CurrentMission,MissionStatus);

        if (CurrentMission <= dsp.mission.id.windurst.THE_SHADOW_AWAITS and (cs ~= 0 or offset ~= 0 or (CurrentMission == dsp.mission.id.windurst.THE_HORUTOTO_RUINS_EXPERIMENT and offset == 0))) then
            if (cs == 0) then
                player:showText(npc,ORIGINAL_MISSION_OFFSET + offset); -- dialog after accepting mission
            else
                player:startEvent(cs,p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8]);
            end
        elseif (CurrentMission ~= dsp.mission.id.windurst.NONE) then
            player:startEvent(76);
        elseif (player:hasCompletedMission(WINDURST,dsp.mission.id.windurst.THE_HORUTOTO_RUINS_EXPERIMENT) == false) then
            player:startEvent(83);
        elseif (player:hasCompletedMission(WINDURST,dsp.mission.id.windurst.THE_HEART_OF_THE_MATTER) == false) then
            player:startEvent(104);
        elseif (player:hasCompletedMission(WINDURST,dsp.mission.id.windurst.THE_PRICE_OF_PEACE) == false) then
            player:startEvent(109);
        elseif (player:hasKeyItem(dsp.ki.MESSAGE_TO_JEUNO_WINDURST)) then
            player:startEvent(163);
        elseif (player:hasCompletedMission(WINDURST,dsp.mission.id.windurst.MOON_READING) == true) then
            player:startEvent(567);
        else
            flagMission, repeatMission = getMissionMask(player);
            player:startEvent(78,flagMission,0,0,0,dsp.ki.STAR_CRESTED_SUMMONS,repeatMission);
        end
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    finishMissionTimeline(player,3,csid,option);

    if (csid == 118 and option == 1) then
        player:addTitle(dsp.title.NEW_BEST_OF_THE_WEST_RECRUIT);
    elseif (csid == 78 and (option == 12 or option == 15)) then
        player:addKeyItem(dsp.ki.STAR_CRESTED_SUMMONS);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.STAR_CRESTED_SUMMONS);
    end
    if (csid == 567) then
        player:setCharVar("WWatersRTenText",1);
    end

end;