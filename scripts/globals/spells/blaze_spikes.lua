-----------------------------------------
-- Spell: Blaze Spikes
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
   target:delStatusEffect(EFFECT_BLAZE_SPIKES);
   target:addStatusEffect(EFFECT_BLAZE_SPIKES,0,0,180);
end;
