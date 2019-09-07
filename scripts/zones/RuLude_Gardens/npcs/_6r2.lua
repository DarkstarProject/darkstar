-----------------------------------
-- Area: Ru'Lud Gardens
-- Door: Bastokian Ambassador
-- Bastok Missions 3.3 "Jeuno" and 4.1 "Magicite"
-- !pos 17 9 -75 243
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

    if (currentMission == dsp.mission.id.bastok.JEUNO and MissionStatus == 4) then
        player:startEvent(38);
    elseif (player:getRank() == 4 and MissionStatus == 0 and player:getCurrentMission(BASTOK) == dsp.mission.id.bastok.NONE and getMissionRankPoints(player,13) == 1) then
        if (player:hasKeyItem(dsp.ki.ARCHDUCAL_AUDIENCE_PERMIT)) then
            player:startEvent(129,1);
        else
            player:startEvent(129);
        end
    elseif (player:getRank() >= 4) then
        player:messageSpecial(ID.text.EMBASSY_DOOR_RESTRICTION); -- restricted area
    else
        player:messageSpecial(ID.text.EMBASSY_DOOR_NO_LETTER); -- you have no letter of introduction
    end

    return 1;

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 38) then
        finishMissionTimeline(player,1,csid,option);
    elseif (csid == 129 and option == 1) then
        player:setVar("MissionStatus",1);
        if (player:hasKeyItem(dsp.ki.ARCHDUCAL_AUDIENCE_PERMIT) == false) then
            player:addKeyItem(dsp.ki.ARCHDUCAL_AUDIENCE_PERMIT);
            player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.ARCHDUCAL_AUDIENCE_PERMIT);
        end
    end

end;