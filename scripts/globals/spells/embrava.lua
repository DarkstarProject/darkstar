--------------------------------------
-- 	Spell: Embrava
-- 	Consumes 20% of your maximum MP. Gradually restores 
--  target party member's HP and MP and increases attack speed.
--------------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
	
	if(target:hasStatusEffect(EFFECT_VIT_DOWN) or caster:hasStatusEffect(EFFECT_VIT_BOOST)) then
		spell:setMsg(75); -- no effect
	else
		local skill = caster:getSkillLevel(ENHANCING_MAGIC_SKILL);
		if (skill > 500) then
			skill = 500;
		end
		local regen = math.floor(skill / 7) + 1;
		local refresh = math.floor(skill / 100) + 1;
		local haste = math.floor(skill/(500/256));
		
		target:addStatusEffect(EFFECT_EMBRAVA,regen,0,180,0,refresh,haste);
	end
	return EFFECT_EMBRAVA;
end;