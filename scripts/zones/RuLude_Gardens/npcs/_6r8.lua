-----------------------------------
-- Area: Ru'Lud Gardens
-- Door: Windurstian Ambassador
-- Windurst Missions 3.3 "A New Journey" and 4.1 "Magicite"
-- !pos 31 9 -22 243
-----------------------------------
local ID = require("scripts/zones/RuLude_Gardens/IDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    pNation = player:getNation();
    currentMission = player:getCurrentMission(pNation);
    MissionStatus = player:getVar("MissionStatus");

    if (currentMission == dsp.mission.id.windurst.A_NEW_JOURNEY and MissionStatus == 4) then
        player:startEvent(40);
    elseif (player:getRank() == 4 and MissionStatus == 0 and player:getCurrentMission(WINDURST) == dsp.mission.id.windurst.NONE and getMissionRankPoints(player,13) == 1) then
        if (player:hasKeyItem(dsp.ki.ARCHDUCAL_AUDIENCE_PERMIT)) then
            player:startEvent(131,1);
        else
            player:startEvent(131);
        end
    elseif (player:getRank() >= 4) then
        player:messageSpecial(ID.text.WINDURST_EMBASSY); -- restricted area
    else
        player:messageSpecial(ID.text.WINDURST_EMBASSY + 1); -- you have no letter of introduction
    end

    return 1;

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 40) then
        finishMissionTimeline(player,1,csid,option);
    elseif (csid == 131 and option == 1) then
        player:setVar("MissionStatus",1);
        if (player:hasKeyItem(dsp.ki.ARCHDUCAL_AUDIENCE_PERMIT) == false) then
            player:addKeyItem(dsp.ki.ARCHDUCAL_AUDIENCE_PERMIT);
            player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.ARCHDUCAL_AUDIENCE_PERMIT);
        end
    elseif (csid == 38 or csid == 35) then
        finishMissionTimeline(player,1,csid,option);
    end

end;