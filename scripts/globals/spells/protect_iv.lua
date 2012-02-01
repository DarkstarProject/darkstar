-----------------------------------------
--	Spell: Protect IV
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
   target:addStatusEffect(EFFECT_PROTECT,40,0,1800);
end;
