-----------------------------------------
-- Spell: Dispel
-- 
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	target:dispelStatusEffect();
end;
