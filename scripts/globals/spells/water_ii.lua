-----------------------------------------
-- Spell: Water II
-- Deals water damage to an enemy.
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	return target:takeMagicDamage(caster);
end;