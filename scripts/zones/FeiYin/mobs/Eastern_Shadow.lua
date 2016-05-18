----------------------------------
-- Area: Fei'Yin
--  NM:  Eastern Shadow
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    -- Set Eastern Shadow's ToD
    SetServerVariable("[POP]Eastern_Shadow", os.time(t) + 36000); -- 10 hours
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Eastern_Shadow");
    SetServerVariable("[PH]Eastern_Shadow", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;
