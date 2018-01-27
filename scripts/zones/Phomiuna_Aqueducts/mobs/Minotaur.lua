-----------------------------------
-- Minotaur
-----------------------------------
require("scripts/globals/missions");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)

    local kills = player:getVar("FOMOR_HATE");

    if (kills > 1) then
        player:setVar("FOMOR_HATE",kills - 2);
    else
        player:setVar("FOMOR_HATE",0);
    end

    if (player:getCurrentMission(COP) == DISTANT_BELIEFS and player:getVar("PromathiaStatus") == 0) then
        player:setVar("PromathiaStatus",1);
    end

end;