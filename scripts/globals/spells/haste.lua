-----------------------------------------
-- Spell: Haste
-- Composure increases duration 3x
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	
	duration = 180;

	if (caster:hasStatusEffect(EFFECT_COMPOSURE) == true and caster == target) then
		duration = duration * 3;
	end
    target:delStatusEffect(EFFECT_HASTE);
    target:addStatusEffect(EFFECT_HASTE,15,0,duration);
end;