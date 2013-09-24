----------------------------------
-- Area: Labyrinth of Onzozo
-- NM: Lord of Onzozo
-----------------------------------


-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)

    -- Set LoO's Window Open Time
    wait = math.random((75600),(86400));
    SetServerVariable("[POP]Lord_of_Onzozo", os.time(t) + wait); -- 18-24 hours
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    PH = GetServerVariable("[PH]Lord_of_Onzozo");
    SetServerVariable("[PH]Lord_of_Onzozo", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;