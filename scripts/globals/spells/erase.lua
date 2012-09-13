-----------------------------------------
-- Spell: Erase
-- 
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	target:eraseStatusEffect();
end;
