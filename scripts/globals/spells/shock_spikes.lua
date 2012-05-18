-----------------------------------------
-- Spell: Shock Spikes
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	duration = 180;
	if (caster:hasStatusEffect(EFFECT_COMPOSURE) == true and caster:getID() == target:getID()) then
		duration = duration * 3;
	end
    target:delStatusEffect(EFFECT_SHOCK_SPIKES);
    target:addStatusEffect(EFFECT_SHOCK_SPIKES,0,0,duration);
end;
