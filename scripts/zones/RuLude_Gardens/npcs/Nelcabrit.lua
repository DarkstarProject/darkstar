-----------------------------------
-- Area: Ru'Lude Gardens
--  NPC: Nelcabrit
-- Involved in Mission: San d'Oria 3-3, 4-1
-- !pos -32 9 -49 243
-----------------------------------
local ID = require("scripts/zones/RuLude_Gardens/IDs");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    pNation = player:getNation();
    currentMission = player:getCurrentMission(SANDORIA);
    missionStatus = player:getVar("MissionStatus");

    if (currentMission == dsp.mission.id.sandoria.APPOINTMENT_TO_JEUNO and missionStatus == 3) then
        player:startEvent(42);
    elseif (currentMission == dsp.mission.id.sandoria.APPOINTMENT_TO_JEUNO and missionStatus == 4) then
        player:startEvent(67);
    elseif (currentMission == dsp.mission.id.sandoria.APPOINTMENT_TO_JEUNO and missionStatus == 5) then
        player:startEvent(39);
    elseif (player:getRank() == 4 and player:getCurrentMission(SANDORIA) == dsp.mission.id.sandoria.NONE and getMissionRankPoints(player,13) == 1) then
        player:startEvent(130); -- Start Mission 4-1 Magicite
    elseif (currentMission == dsp.mission.id.sandoria.MAGICITE_SAN_D_ORIA and missionStatus == 1) then
        player:startEvent(133);
    elseif (currentMission == dsp.mission.id.sandoria.MAGICITE_SAN_D_ORIA and missionStatus <= 5) then
        player:startEvent(136);
    elseif (currentMission == dsp.mission.id.sandoria.MAGICITE_SAN_D_ORIA and missionStatus == 6) then
        player:startEvent(36);
    elseif (player:hasKeyItem(dsp.ki.MESSAGE_TO_JEUNO_SANDORIA)) then
        player:startEvent(56);
    elseif (pNation == dsp.nation.WINDURST) then
        player:startEvent(47);
    elseif (pNation == dsp.nation.BASTOK) then
        player:startEvent(46);
    else
        player:startEvent(102);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 42) then
        player:setVar("MissionStatus",4);
        player:delKeyItem(dsp.ki.LETTER_TO_THE_AMBASSADOR);
    elseif (csid == 130 and option == 1) then
        player:setVar("MissionStatus",1);
        player:addKeyItem(dsp.ki.ARCHDUCAL_AUDIENCE_PERMIT);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.ARCHDUCAL_AUDIENCE_PERMIT);
    elseif (csid == 39 or csid == 36) then
        finishMissionTimeline(player,3,csid,option);
    end

end;