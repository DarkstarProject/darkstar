-----------------------------------
-- Area: Inner Horutoto Ruins
--  NPC: _5cb (Gate of Darkness)
-- !pos -228 0 99 192
-----------------------------------
local ID = require("scripts/zones/Inner_Horutoto_Ruins/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getCurrentMission(WINDURST) == dsp.mission.id.windurst.THE_JESTER_WHO_D_BE_KING and player:getVar("MissionStatus") == 9) then
        player:startEvent(75);
    else
        player:messageSpecial(ID.text.DOOR_FIRMLY_CLOSED);
    end
    return 1;
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 75) then
        player:setVar("MissionStatus",10)
    end
end;