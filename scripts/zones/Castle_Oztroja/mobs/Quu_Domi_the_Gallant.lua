-----------------------------------
--  Area: Castle Oztroja (151)
--   Mob: Quu_Domi_the_Gallant
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	

    -- Set Quu_Domi_the_Gallant's Window Open Time
    wait = math.random((3600),(10800));
    SetServerVariable("[POP]Quu_Domi_the_Gallant", os.time(t) + wait); -- 1-3 hours
    DeterMob(mob:getID(), true);
    
    -- Set PH back to normal, then set to respawn spawn
    PH = GetServerVariable("[PH]Quu_Domi_the_Gallant");
    SetServerVariable("[PH]Quu_Domi_the_Gallant", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;

