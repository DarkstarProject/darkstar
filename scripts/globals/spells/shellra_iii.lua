-----------------------------------------
--	Spell: Shellra III
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
   target:addStatusEffect(EFFECT_SHELL,30,0,1800);
end;
