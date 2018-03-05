-----------------------------------
-- Area: Fort Ghelsba
--  MOB: Orcish Fighter
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    local OrcPanzer = 17354894;
    local OrcFighter = 17354895;

    if (mob:getID() == OrcFighter) then
        -- Set Orcish Panzer's respawn time to be 60-70 min from now.
        GetMobByID(OrcPanzer):setRespawnTime(math.random(3600,4200));
    end
end;
