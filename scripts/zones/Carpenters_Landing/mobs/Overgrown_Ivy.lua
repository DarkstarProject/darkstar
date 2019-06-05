-----------------------------------
-- Area: Carpenters_Landing
--  Mob: Overgrown_Ivy
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if (player:getCurrentMission(COP) == dsp.mission.id.cop.THE_ROAD_FORKS and player:getVar("EMERALD_WATERS_Status") == 4) then
        player:setVar("EMERALD_WATERS_Status",5);
    end
end;