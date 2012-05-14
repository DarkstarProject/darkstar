-----------------------------------------
-- Spell: Shell III
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	duration = 1800;
	if (caster:hasStatusEffect(EFFECT_COMPOSURE) == true and caster == target) then
		duration = duration * 3;
	end
    target:delStatusEffect(EFFECT_SHELL);
    target:addStatusEffect(EFFECT_SHELL,30,0,duration);
end;
