-----------------------------------------
--	Spell: Shellra IV
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
   target:delStatusEffect(EFFECT_SHELL);
   target:addStatusEffect(EFFECT_SHELL,40,0,1800);
end;
