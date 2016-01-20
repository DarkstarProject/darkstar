----------------------------------
-- Area: Labyrinth of Onzozo
--   NM: Narasimha
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)

    -- Set Narasimha's Window Open Time
    local wait = math.random(21600,36000); -- 6-10 hours
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Narasimha");
    SetServerVariable("[PH]Narasimha", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;