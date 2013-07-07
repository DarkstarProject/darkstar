-----------------------------------	
-- Area: West Sarutabaruta	
--   NM: Tom Tit Tat	
-----------------------------------	

-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	

    -- Set Tom_Tit_Tat's Window Open Time
    wait = math.random((3600),(7200))
    SetServerVariable("[POP]Tom_Tit_Tat", os.time(t) + wait); -- 1- 2 hours
    DeterMob(mob:getID(), true);
    
    -- Set PH back to normal, then set to respawn spawn
    PH = GetServerVariable("[PH]Tom_Tit_Tat");
    SetServerVariable("[PH]Tom_Tit_Tat", 0);
    DeterMob(PH, false);
    mob:setRespawnTime(GetMobRespawnTime(PH));
    
end;	
