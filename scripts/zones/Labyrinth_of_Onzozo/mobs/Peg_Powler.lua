----------------------------------
-- Area: Labyrinth of Onzozo
--   NM: Peg Powler
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkGoVregime(player,mob,774,1);

    -- Set Peg Powler's Window Open Time
    local wait = math.random((7200),(57600));
    SetServerVariable("[POP]Peg_Powler", os.time(t) + wait); -- 2-16 hours
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Peg_Powler");
    SetServerVariable("[PH]Peg_Powler", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;