-----------------------------------------
-- Spell: Animus Minuo
-- Suppresses enmity gain for target 
-- party member.
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)

   	local power = -10;
	local duration = 180;

	-- Estoqueurs Bonus
	duration = duration + (duration * caster:getMod(MOD_ENHANCING_DUR));
	
	target:delStatusEffect(EFFECT_PAX);
	target:addStatusEffect(EFFECT_PAX,power,0,duration);

    return EFFECT_PAX;
end;