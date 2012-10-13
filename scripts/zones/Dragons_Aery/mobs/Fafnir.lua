-----------------------------------
-- Area: Dragons Aery
-- NPC:  Fafnir
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");

-----------------------------------
-- OnMobInitialise Action
-----------------------------------

function onMobInitialize(mob)
	mob:addStatusEffect(EFFECT_REGAIN,25,3,0);
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
	
	if(mob:getBattleTime() == 3600) then
		mob:rageMode();
	end
	
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	killer:addTitle(FAFNIR_SLAYER);
end;