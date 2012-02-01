-----------------------------------------
--	Spell: Shellra IV
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
   target:addStatusEffect(EFFECT_SHELL,40,0,1800);
end;
