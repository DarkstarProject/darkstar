-----------------------------------
-- Stegotaur
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)

    local kills = player:getVar("FOMOR_HATE");
    if (kills > 4) then
        player:setVar("FOMOR_HATE",kills -4);
    end
end;