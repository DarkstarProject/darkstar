-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Arnau
--  Involved in Mission: Save the Children
-- !pos 148 0 139 231
-----------------------------------
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getCurrentMission(COP) == dsp.mission.id.cop.THE_ROAD_FORKS and player:getVar("EMERALD_WATERS_Status") == 2) then
        player:startEvent(51); --COP event
    elseif (player:getCurrentMission(SANDORIA) == dsp.mission.id.sandoria.SAVE_THE_CHILDREN and player:getVar("MissionStatus") < 2) then
        player:startEvent(693);
    elseif (player:hasCompletedMission(SANDORIA,dsp.mission.id.sandoria.SAVE_THE_CHILDREN) and player:getVar("OptionalCSforSTC") == 1) then
        player:startEvent(694);
    else
        player:startEvent(20);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 51) then
        player:setVar("EMERALD_WATERS_Status",3);
    elseif (csid == 693) then
        player:setVar("MissionStatus",2);
    elseif (csid == 694) then
        player:setVar("OptionalCSforSTC",0);
    end
end;