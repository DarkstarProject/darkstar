-----------------------------------
-- Area: VeLugannon Palace
-- NPC:  Brigandish Blade
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)	
	mob:setMobMod(MOBMOD_ADD_EFFECT,mob:getShortID());
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob, killer)
	GetNPCByID(17502582):hideNPC(300);
end;

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------
function onAdditionalEffect(mob,target,damage)

	local rand = math.random(1,10);
	
	if ((rand >= 4) or (target:hasStatusEffect(EFFECT_TERROR) == true)) then -- 30% chance to terror
		return 0,0,0;
	else
		local duration = math.random(3,5);
		target:addStatusEffect(EFFECT_TERROR,1,0,duration);
		return SUBEFFECT_NONE,0,EFFECT_TERROR;
	end
    
end;