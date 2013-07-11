-----------------------------------
-- Area: Attohwa Chasm
-- NPC:  Tiamat
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");

-----------------------------------
-- OnMobInitialise Action
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
	
	-- Gains a large attack boost when health is under 25% which cannot be Dispelled. 
	if(mob:getHP() < ((mob:getMaxHP() / 10) * 2.5)) then
		if(mob:hasStatusEffect(EFFECT_ATTACK_BOOST) == false) then
			mob:addStatusEffect(EFFECT_ATTACK_BOOST,75,0,0);
		end
	end
	
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	killer:addTitle(TIAMAT_TROUNCER);
end;