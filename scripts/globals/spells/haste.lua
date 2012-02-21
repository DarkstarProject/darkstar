-----------------------------------------
-- Spell: Haste
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
   target:delStatusEffect(EFFECT_HASTE);
   target:addStatusEffect(EFFECT_HASTE,15,0,180);
end;