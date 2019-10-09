-----------------------------------
-- Area: Kazham
--   NPC: Romaa Mihgo
-- Type: Standard NPC
-- !pos 29.000 -13.023 -176.500 250
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getCurrentMission(WINDURST) == dsp.mission.id.windurst.AWAKENING_OF_THE_GODS and player:getCharVar("MissionStatus") == 2) then
        player:startEvent(266);
    elseif (player:getCurrentMission(WINDURST) == dsp.mission.id.windurst.AWAKENING_OF_THE_GODS and player:getCharVar("MissionStatus") == 3) then
        player:startEvent(267);
    else
        player:startEvent(263);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 266) then
        player:setCharVar("MissionStatus",3);
    end

end;
