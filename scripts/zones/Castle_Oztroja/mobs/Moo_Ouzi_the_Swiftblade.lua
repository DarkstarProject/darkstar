-----------------------------------
--  Area: Castle Oztroja (151)
--   Mob: Moo_Ouzi_the_Swiftblade
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	

    -- Set Moo_Ouzi_the_Swiftblade's Window Open Time
    wait = math.random((3600),(10800));
    SetServerVariable("[POP]Moo_Ouzi_the_Swiftblade", os.time(t) + wait); -- 1-3 hours
    DeterMob(mob:getID(), true);
    
    -- Set PH back to normal, then set to respawn spawn
    PH = GetServerVariable("[PH]Moo_Ouzi_the_Swiftblade");
    SetServerVariable("[PH]Moo_Ouzi_the_Swiftblade", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;

