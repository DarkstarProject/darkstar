-----------------------------------------
-- Spell: Arise
-- Revives target from KO and grants the
-- effect of Reraise III.
-- MP Cost: 300
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
	target:sendRaise(3);
	target:delStatusEffect(EFFECT_RERAISE);
	target:addStatusEffect(EFFECT_RERAISE,3,0,3600); -- Reraise III, 1 Hr duration
end;