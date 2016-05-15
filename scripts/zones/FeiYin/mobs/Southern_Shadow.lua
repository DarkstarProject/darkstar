----------------------------------
-- Area: Fei'Yin
--  NM:  Southern Shadow
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    -- Set Southern Shadow's ToD
    SetServerVariable("[POP]Southern_Shadow", os.time(t) + 57600); -- 16 hours
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Southern_Shadow");
    SetServerVariable("[PH]Southern_Shadow", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;
