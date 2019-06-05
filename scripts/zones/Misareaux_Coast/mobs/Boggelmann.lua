-----------------------------------
-- Area: Misareaux Coast
--  Mob: Boggelmann
-----------------------------------
require("scripts/globals/missions");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if (player:getCurrentMission(COP) == dsp.mission.id.cop.CALM_BEFORE_THE_STORM and player:getVar("COP_Boggelmann_KILL") == 0) then
        player:setVar("COP_Boggelmann_KILL",1);
    end
end;
