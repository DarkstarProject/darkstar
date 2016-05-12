----------------------------------
-- Area: Gustav Tunnel
--   NM: Ungur
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    -- Set Ungur's Window Open Time
    SetServerVariable("[POP]Ungur", os.time(t) + 7200); -- 2 hours
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Ungur");
    SetServerVariable("[PH]Ungur", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;