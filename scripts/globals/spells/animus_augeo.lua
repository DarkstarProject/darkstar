-----------------------------------------
-- Spell: Animus Augeo
-- Facilitates enmity gain for target 
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

   	local power = 20;
	local duration = 180;

	-- Estoqueurs Bonus
	duration = duration + (duration * caster:getMod(MOD_ENHANCING_DUR));
	
	target:delStatusEffect(EFFECT_ENMITY_BOOST);
	target:addStatusEffect(EFFECT_ENMITY_BOOST,power,0,duration);

    return EFFECT_ENMITY_BOOST;
end;