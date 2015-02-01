-----------------------------------------
-- Spell: Myoshui: Ichi
-- Uses the ninja tool, "Kabenro".
-- Reduces TP dealt when striking an
-- enemy.
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
	target:delStatusEffect(EFFECT_SUBTLE_BLOW_PLUS);
	-- The power is unknown.
	target:addStatusEffect(EFFECT_SUBTLE_BLOW_PLUS,EFFECT_SUBTLE_BLOW_PLUS,10,0,180);
	spell:setMsg(230);

	return EFFECT_SUBTLE_BLOW_PLUS;
end;