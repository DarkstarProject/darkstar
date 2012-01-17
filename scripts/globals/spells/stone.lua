-----------------------------------------
--	Spell: Stone
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
   return target:takeMagicDamage(caster);
end;