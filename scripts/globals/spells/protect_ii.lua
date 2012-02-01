-----------------------------------------
--	Spell: Protect II
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
   target:addStatusEffect(EFFECT_PROTECT,20,0,1800);
end;
