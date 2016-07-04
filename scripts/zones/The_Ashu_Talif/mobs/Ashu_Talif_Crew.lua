-----------------------------------	
-- mob: ashu talif crew	
-----------------------------------	


-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobInitialize(mob)
	 mob:setMobMod( MOBMOD_ROAM_TURNS , 0);
	 mob:setMobMod( MOBMOD_SPAWN_LEASH , 0);
end;
	

	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	

	local instance = mob:getInstance();
    instance:setProgress(instance:getProgress() + 1);
end;	


-----------------------------------
-- onMobFight
-----------------------------------


