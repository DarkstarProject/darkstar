-----------------------------------
-- Area: Misareaux_Coast
--  MOB: Fomor Monk
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    local ills = player:getVar("FOMOR_HATE");

    if (kills < 60) then
        player:setVar("FOMOR_HATE",kills + 2);
    end
end;