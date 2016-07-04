-----------------------------------
-- Area: Fort Ghelsba
--  MOB: Orcish Fighter
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local OrcPanzer = 17354894;
    local OrcFighter = 17354895;
    -- Making sure we've got the correct Orcish Fighter here, as others exist in zone.
    if (mob:getID() == OrcFighter) then
        -- Set Orcish Panzer's respawn time to be 60-70 min from now.
        GetMobByID(OrcPanzer):setRespawnTime(math.random(3600,4200));
    end
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    local OrcPanzer = 17354894;
    -- Set Orcish Panzer's respawn time to be 60-70 min from now.
    GetMobByID(OrcPanzer):setRespawnTime(math.random(3600,4200));
end;