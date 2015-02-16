-----------------------------------	
-- Area: Xarcabard	
-- NM:  Biast
-- ID: 17235988
-----------------------------------	
require("scripts/globals/status");
-----------------------------------


-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)	
	mob:setMobMod(MOBMOD_ADD_EFFECT,mob:getShortID());
end;

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
	mob:addMod(MOD_STR,27);
	mob:addMod(MOD_DEX,5);
	mob:addMod(MOD_ACC,100);
	mob:addMod(MOD_MACC,400);	
	mob:addMod(MOD_REGAIN,33);
end;	

-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	

	killer:addTitle(BLACK_DEATH);
	
    -- Set Biast's ToD
    SetServerVariable("[POP]Biast", os.time(t) + 75600); -- 21 hour 
	DeterMob(17235987, false);
	GetMobByID(17235987):setRespawnTime(GetMobRespawnTime(17235987));
  
end;

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------
function onAdditionalEffect(mob,target,damage)
	
	if ((math.random(1,15) ~= 5) or (target:hasStatusEffect(EFFECT_TERROR) == true)) then
		return 0,0,0;
	else
		local duration = 5;
		target:addStatusEffect(EFFECT_TERROR,1,0,duration);
		mob:resetEnmity(target);
		return SUBEFFECT_NONE,0,EFFECT_TERROR;
	end
    
end;