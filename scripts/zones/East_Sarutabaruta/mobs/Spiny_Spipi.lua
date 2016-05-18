-----------------------------------
-- Area: East Sarutabaruta
--  NM:  Spiny Spipi
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    -- Set Spiny_Spipi's Window Open Time
    local wait = math.random(2700,7200)
    SetServerVariable("[POP]Spiny_Spipi", os.time(t) + wait); -- 45 - 120 minutes
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Spiny_Spipi");
    SetServerVariable("[PH]Spiny_Spipi", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;