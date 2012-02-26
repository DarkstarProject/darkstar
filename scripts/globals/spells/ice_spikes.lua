-----------------------------------------
-- Spell: Ice Spikes
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
   target:delStatusEffect(EFFECT_ICE_SPIKES);
   target:addStatusEffect(EFFECT_ICE_SPIKES,0,0,180);
end;
