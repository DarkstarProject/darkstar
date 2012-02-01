-----------------------------------------
--	Spell: Shell
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
   target:addStatusEffect(EFFECT_SHELL,10,0,1800);
end;
