-----------------------------------
-- Area: Bostaunieux Oubliette (167)
-- Mob: Bloodsucker (NM)
-- @pos -21.776 16.983 -231.477 167
-----------------------------------


-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	

  mobID = mob:getID();	
 
	if(mobID == 17461478) then 
		UpdateNMSpawnPoint(mob);
		mob:setRespawnTime(259200);
		
	end	
end;

