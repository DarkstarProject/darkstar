-----------------------------------
-- Area: Misareaux Coast
--  Mob: Warder Euphrosyne
-----------------------------------
require("scripts/globals/missions");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if (player:getCurrentMission(COP) == dsp.mission.id.cop.A_PLACE_TO_RETURN and player:getVar("PromathiaStatus") == 1) then
        player:setVar("Warder_Euphrosyne_KILL",1);
    end
end;