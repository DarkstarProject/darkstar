-----------------------------------
-- Area: Windurst Waters
-- NPC:  Mokyoko
-- Starts Windurst Missions
-- @pos -55 -8 227 238
-----------------------------------
package.loaded["scripts/globals/missions"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
local TextIDs = require("scripts/zones/Windurst_Waters/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (player:getNation() ~= NATION_WINDURST) then
        player:startEvent(0x0067); -- for other nation
    else
        CurrentMission = player:getCurrentMission(WINDURST);
        MissionStatus = player:getVar("MissionStatus");
        pRank = player:getRank();
        cs, p, offset = getMissionOffset(player,2,CurrentMission,MissionStatus);

        if (CurrentMission <= 15 and (cs ~= 0 or offset ~= 0 or (CurrentMission == 0 and offset == 0))) then
            if (cs == 0) then
                player:showText(npc,ORIGINAL_MISSION_OFFSET + offset); -- dialog after accepting mission
            else
                player:startEvent(cs,p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8]);
            end
        elseif (CurrentMission ~= 255) then
            player:startEvent(0x006d);
        elseif (player:hasCompletedMission(WINDURST,THE_HORUTOTO_RUINS_EXPERIMENT) == false) then
            player:startEvent(0x0076);
        elseif (player:hasCompletedMission(WINDURST,THE_HEART_OF_THE_MATTER) == false) then
            player:startEvent(0x0082);
        elseif (player:hasCompletedMission(WINDURST,THE_PRICE_OF_PEACE) == false) then
            player:startEvent(0x0083);
        elseif (player:hasKeyItem(MESSAGE_TO_JEUNO_WINDURST)) then
            player:startEvent(0x00e8);
        else
            flagMission, repeatMission = getMissionMask(player);
            player:startEvent(0x006f,flagMission,0,0,0,STAR_CRESTED_SUMMONS,repeatMission);
        end
    end

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
printf("RESULT: %u",option);

    finishMissionTimeline(player,2,csid,option);

    if (csid == 0x0076 and option == 1) then
        player:addTitle(FRESH_NORTH_WINDS_RECRUIT);
    elseif (csid == 0x006f and (option == 12 or option == 15)) then
        player:addKeyItem(STAR_CRESTED_SUMMONS);
        player:messageSpecial(TextIDs.KEYITEM_OBTAINED,STAR_CRESTED_SUMMONS);
    end

end;
