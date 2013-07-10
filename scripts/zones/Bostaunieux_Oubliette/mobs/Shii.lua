-----------------------------------
--  Area: Bostaunieux Oubliette (167)
--   Mob: Shii
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	

    -- Set Shii's Window Open Time
    wait = math.random((14400),(28800));
    SetServerVariable("[POP]Shii", os.time(t) + wait); -- 4-8 hours
    DeterMob(mob:getID(), true);
    
    -- Set PH back to normal, then set to respawn spawn
    PH = GetServerVariable("[PH]Shii");
    SetServerVariable("[PH]Shii", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;

