-----------------------------------
--  Area: Castle Oztroja (151)
--   Mob: Mee_Deggi_the_Punisher
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	

    -- Set Mee_Deggi_the_Punisher's Window Open Time
    wait = math.random((3600),(10800));
    SetServerVariable("[POP]Mee_Deggi_the_Punisher", os.time(t) + wait); -- 1-3 hours
    DeterMob(mob:getID(), true);
    
    -- Set PH back to normal, then set to respawn spawn
    PH = GetServerVariable("[PH]Mee_Deggi_the_Punisher");
    SetServerVariable("[PH]Mee_Deggi_the_Punisher", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;

