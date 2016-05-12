----------------------------------
-- Area: Labyrinth of Onzozo
--   NM: Ose
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    -- Set Ose's Window Open Time
    SetServerVariable("[POP]Ose", os.time(t) + 3600); -- 1 hour
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Ose");
    SetServerVariable("[PH]Ose", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;