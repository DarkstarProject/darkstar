----------------------------------
-- Area: Gustav Tunnel
--   NM: Taxim
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    -- Set Taxim's Window Open Time
    SetServerVariable("[POP]Taxim", os.time(t) + 7200); -- 2 hours
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Taxim");
    SetServerVariable("[PH]Taxim", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;