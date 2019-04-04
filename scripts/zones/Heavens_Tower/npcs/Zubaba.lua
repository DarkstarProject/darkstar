-----------------------------------
-- Area: Heavens Tower
--  NPC: Zubaba
-- Involved in Mission 3-2
-- !pos 15 -27 18 242
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/missions");
local ID = require("scripts/zones/Heavens_Tower/IDs");
-----------------------------------

function onTrade(player,npc,trade)

    local currentMission = player:getCurrentMission(WINDURST);
    local nextMissionFinished = player:hasCompletedMission(WINDURST,dsp.mission.id.windurst.A_NEW_JOURNEY);

    if (currentMission == WRITTEN_IN_THE_STARS and player:getVar("MissionStatus") == 3) then
        if (trade:hasItemQty(16447,3) and trade:getItemCount() == 3) then -- Trade Rusty Dagger
            player:tradeComplete();
            player:startEvent(151);
        end
    end

end;

function onTrigger(player,npc)

    local currentMission = player:getCurrentMission(WINDURST);
    local MissionStatus = player:getVar("MissionStatus");
    local nextMissionFinished = player:hasCompletedMission(WINDURST,dsp.mission.id.windurst.A_NEW_JOURNEY);

    if (currentMission == WRITTEN_IN_THE_STARS and nextMissionFinished == false) then
        if (MissionStatus == 0) then
            player:startEvent(121);
        elseif (MissionStatus == 1) then
            player:startEvent(122);
        elseif (MissionStatus == 2) then
            player:startEvent(135);
        end
    elseif (currentMission == WRITTEN_IN_THE_STARS and (nextMissionFinished or player:hasCompletedMission(WINDURST,dsp.mission.id.windurst.WRITTEN_IN_THE_STARS))) then
        if (MissionStatus == 0) then
            player:startEvent(257,0,16447); -- Rusty Dagger
        elseif (MissionStatus == 3) then
            player:startEvent(150,0,16447);
        end
    elseif (player:hasKeyItem(dsp.ki.STAR_CRESTED_SUMMONS)) then
        player:startEvent(157);
    elseif (currentMission == THE_SHADOW_AWAITS and player:hasKeyItem(dsp.ki.SHADOW_FRAGMENT)) then
        player:startEvent(194); -- her reaction after 5-1.
    elseif (player:getCurrentMission(WINDURST) == dsp.mission.id.windurst.MOON_READING and (MissionStatus >= 3 or player:hasCompletedMission(WINDURST, dsp.mission.id.windurst.MOON_READING))) then
        player:startEvent(387);
    else
        player:startEvent(56);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 121) then
        player:addKeyItem(dsp.ki.CHARM_OF_LIGHT);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.CHARM_OF_LIGHT);
        player:setVar("MissionStatus",1);
    elseif (csid == 149 or csid == 257) then
        player:setVar("MissionStatus",3);
    elseif (csid == 135 or csid == 151) then
        finishMissionTimeline(player,1,csid,option);
    elseif (csid == 387) then
        player:setVar("WindurstSecured",0);
    end

end;