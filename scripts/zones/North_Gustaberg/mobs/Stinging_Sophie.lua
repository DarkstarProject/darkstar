----------------------------------	
-- Area: North Gustaberg
-- NM: Stinging Sophie
-----------------------------------	

require("scripts/globals/fieldsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	

    -- Set Stinging_Sophie's Window Open Time
    wait = math.random((1200),(3600))
    SetServerVariable("[POP]Stinging_Sophie", os.time(t) + wait); -- 20-60 minutes
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    PH = GetServerVariable("[PH]Stinging_Sophie");
    SetServerVariable("[PH]Stinging_Sophie", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));
  
end;