-----------------------------------
-- Area: Carpenters' Landing
-- Mob:  Orctrap (NM)
-- @pos 180.087 -5.484 -532.799 2
-----------------------------------

require("scripts/zones/Carpenters_Landing/MobIDs");
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	

    -- Set Orctrap's ToD
    SetServerVariable("[POP]Orctrap", os.time(t) + math.random((3600),(25200))); -- 1-7 hours 
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    PH = GetServerVariable("[PH]Orctrap");
    SetServerVariable("[PH]Orctrap", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));
  
end;