-----------------------------------------
-- Spell: Reraise
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
    target:delStatusEffect(EFFECT_RERAISE);
    target:addStatusEffect(EFFECT_RERAISE,1,0,duration); --reraise 1, 30min duration
end;