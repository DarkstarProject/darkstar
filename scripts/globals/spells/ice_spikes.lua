-----------------------------------------
-- Spell: Ice Spikes
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
	
   target:delStatusEffect(EFFECT_ICE_SPIKES);
   target:addStatusEffect(EFFECT_ICE_SPIKES,0,0,duration);
end;
