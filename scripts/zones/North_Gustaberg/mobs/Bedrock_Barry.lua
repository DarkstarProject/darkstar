-----------------------------------	
-- Area: North Gustaberg	
-- MOB:  Bedrock Barry	
-----------------------------------	
	
require("/scripts/globals/fieldsofvalor");	
require("/scripts/globals/status");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobSpawn(mob)
	mob:addStatusEffect(EFFECT_STONESKIN, math.random(30,40), 0, 300);
end;

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,16,1);
end;	
