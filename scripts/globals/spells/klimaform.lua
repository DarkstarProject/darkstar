-----------------------------------------
-- Spell: Klimaform
-- Increases MACC for spells of the same
-- element as current weather.
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)

   	local power = 1;
	local duration = 180;

	-- Estoqueurs Bonus
	duration = duration + (duration * caster:getMod(MOD_ENHANCING_DUR));
	
	target:delStatusEffect(EFFECT_KLIMAFORM);
	target:addStatusEffect(EFFECT_KLIMAFORM,power,0,duration);

    return EFFECT_KLIMAFORM;
end;