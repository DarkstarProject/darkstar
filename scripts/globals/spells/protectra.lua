-----------------------------------------
-- Spell: Protectra
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
   target:delStatusEffect(EFFECT_PROTECT);
   target:addStatusEffect(EFFECT_PROTECT,10,0,1800);
end;
