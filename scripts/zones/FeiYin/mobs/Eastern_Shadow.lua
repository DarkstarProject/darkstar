----------------------------------
-- Area: Fei'Yin
--  NM:  Eastern Shadow
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)

    -- Set Eastern Shadow's ToD
    SetServerVariable("[POP]Eastern_Shadow", os.time() + 36000); -- 10 hours
    DisallowRespawn(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Eastern_Shadow");
    SetServerVariable("[PH]Eastern_Shadow", 0);
    DisallowRespawn(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;
