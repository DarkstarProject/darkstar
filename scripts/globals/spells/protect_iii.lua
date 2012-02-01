-----------------------------------------
--	Spell: Protect III
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
   target:addStatusEffect(EFFECT_PROTECT,30,0,1800);
end;
