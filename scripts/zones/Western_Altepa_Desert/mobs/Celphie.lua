-----------------------------------
--  Area: Western Altepa Desert (125)
--   Mob: Celphie
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	

    -- Set Celphie's Window Open Time
    wait = math.random((7200),(28800));
    SetServerVariable("[POP]Celphie", os.time(t) + wait); -- 2-8 hours
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    PH = GetServerVariable("[PH]Celphie");
    SetServerVariable("[PH]Celphie", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));
  
end;
