-----------------------------------------
-- Spell: Reraise 3
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	duration = 1800;
	if (caster:hasStatusEffect(EFFECT_COMPOSURE) == true and caster:getID() == target:getID()) then
		duration = duration * 3;
	end
    target:delStatusEffect(EFFECT_RERAISE);
    target:addStatusEffect(EFFECT_RERAISE,3,0,duration); --reraise 3, 30min duration
end;