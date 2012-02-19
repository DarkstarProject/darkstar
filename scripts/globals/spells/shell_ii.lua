-----------------------------------------
--	Spell: Shell II
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
   target:delStatusEffect(EFFECT_SHELL);
   target:addStatusEffect(EFFECT_SHELL,20,0,1800);
end;
