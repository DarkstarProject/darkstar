-----------------------------------	
-- Area: East Ronfaure	
-- MOB:  Swamfisk	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	

    -- Set Swamfisk's Window Open Time
    wait = math.random((3600),(10800));
    SetServerVariable("[POP]Swamfisk", os.time(t) + wait); -- 1-3 hours
    DeterMob(mob:getID(), true);
    
    -- Set PH back to normal, then set to respawn spawn
    PH = GetServerVariable("[PH]Swamfisk");
    SetServerVariable("[PH]Swamfisk", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));
    
end;	
