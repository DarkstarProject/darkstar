-----------------------------------------
-- Spell: Blizzaga II
-- Deals ice damage to enemies within area of effect.
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	return target:takeMagicDamage(caster);
end;