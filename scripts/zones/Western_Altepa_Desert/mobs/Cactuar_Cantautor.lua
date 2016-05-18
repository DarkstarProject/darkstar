-----------------------------------
-- Area: Western Altepa Desert (125)
--   NM: Cactuar_Cantautor
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    -- Set Cactuar_Cantautor's Window Open Time
    local wait = math.random(3600,43200);
    SetServerVariable("[POP]Cactuar_Cantautor", os.time(t) + wait); -- 1-12 hours
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Cactuar_Cantautor");
    SetServerVariable("[PH]Cactuar_Cantautor", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;

