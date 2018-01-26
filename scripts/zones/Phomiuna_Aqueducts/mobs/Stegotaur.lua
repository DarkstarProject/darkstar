-----------------------------------
-- mob : Stegotaur
-- zone : Phomiuna_Aqueducts
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)

    local kills = player:getVar("FOMOR_HATE");
    if (kills > 0) then
        player:setVar("FOMOR_HATE",kills -1);
    end
end;