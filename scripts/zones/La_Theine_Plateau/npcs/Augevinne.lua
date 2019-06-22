-----------------------------------
-- Area: La Theine Plateau
--  NPC: Augevinne
-- Involved in Mission: The Rescue Drill
-- !pos -361 39 266 102
-----------------------------------
require("scripts/globals/missions");
local ID = require("scripts/zones/La_Theine_Plateau/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getCurrentMission(SANDORIA) == dsp.mission.id.sandoria.THE_RESCUE_DRILL) then
        local MissionStatus = player:getVar("MissionStatus");

        if (MissionStatus >= 5 and MissionStatus <= 7) then
            player:startEvent(103);
        elseif (MissionStatus == 8) then
            player:showText(npc, ID.text.RESCUE_DRILL + 21);
        elseif (MissionStatus >= 9) then
            player:showText(npc, ID.text.RESCUE_DRILL + 26);
        else
            player:showText(npc, ID.text.RESCUE_DRILL);
        end
    else
        player:showText(npc, ID.text.RESCUE_DRILL);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
