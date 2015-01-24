-----------------------------------------
-- Spell: Adloquium
-- Gradually restores target party member's 
-- TP. 1 TP per tic for 60 TP total.
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)

   	local tp = 1;
	local duration = 180;

	-- Estoqueurs Bonus
	duration = duration + (duration * caster:getMod(MOD_ENHANCING_DUR));
	
	target:delStatusEffect(EFFECT_REGAIN);
	target:addStatusEffect(EFFECT_REGAIN,tp,3,duration);

    return EFFECT_REGAIN;
end;