-----------------------------------
-- Area: Dragons Aery
-- NPC:  Fafnir
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
	
	if(mob:hasStatusEffect(EFFECT_REGAIN) == false) then
		mob:addStatusEffect(EFFECT_REGAIN,25,3,0); -- Regain Effect
	end
	
	if(mob:getBattleTime() == 3600) then
		mob:rageMode();
	end
	
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	killer:setTitle(FAFNIR_SLAYER);
end;