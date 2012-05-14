-----------------------------------------
-- Spell: Blaze Spikes
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
   target:delStatusEffect(EFFECT_BLAZE_SPIKES);
   target:addStatusEffect(EFFECT_BLAZE_SPIKES,0,0,duration);
end;
