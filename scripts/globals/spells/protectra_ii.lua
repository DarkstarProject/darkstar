-----------------------------------------
-- Spell: Protectra II
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
   target:delStatusEffect(EFFECT_PROTECT);
   target:addStatusEffect(EFFECT_PROTECT,20,0,1800);
end;
