
-----------------------------------
-- Stegotaur
-----------------------------------




-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    kills = player:getVar("FOMOR_HATE");
    if (kills > 4) then
        player:setVar("FOMOR_HATE",kills -4);
    end
end;