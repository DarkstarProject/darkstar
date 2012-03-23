-----------------------------------------
-- Spell: Reraise 2
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
   target:delStatusEffect(EFFECT_RERAISE);
   target:addStatusEffect(EFFECT_RERAISE,2,0,1800); --reraise 2, 30min duration
end;