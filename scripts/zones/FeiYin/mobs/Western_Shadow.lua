----------------------------------
-- Area: Fei'Yin
--  NM:  Western Shadow
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    -- Set Western Shadow's ToD
    SetServerVariable("[POP]Western_Shadow", os.time(t) + 36000); -- 10 hours
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Western_Shadow");
    SetServerVariable("[PH]Western_Shadow", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;
