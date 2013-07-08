-----------------------------------
--  Area: Batallia Downs (105)
--   Mob: Tottering_Toby
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	

    -- Set Tottering_Toby's Window Open Time
    wait = math.random((3600),(10800));
    SetServerVariable("[POP]Tottering_Toby", os.time(t) + wait); -- 1-6 hours
    DeterMob(mob:getID(), true);
    
    -- Set PH back to normal, then set to respawn spawn
    PH = GetServerVariable("[PH]Tottering_Toby");
    SetServerVariable("[PH]Tottering_Toby", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;

