-----------------------------------------
-- Spell: Shock Spikes
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
   target:delStatusEffect(EFFECT_SHOCK_SPIKES);
   target:addStatusEffect(EFFECT_SHOCK_SPIKES,0,0,180);
end;
