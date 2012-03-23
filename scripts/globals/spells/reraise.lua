-----------------------------------------
-- Spell: Reraise
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
   target:delStatusEffect(EFFECT_RERAISE);
   target:addStatusEffect(EFFECT_RERAISE,1,0,1800); --reraise 1, 30min duration
end;