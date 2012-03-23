-----------------------------------------
-- Spell: Reraise 3
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
   target:delStatusEffect(EFFECT_RERAISE);
   target:addStatusEffect(EFFECT_RERAISE,3,0,1800); --reraise 3, 30min duration
end;