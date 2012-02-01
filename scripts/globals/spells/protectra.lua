-----------------------------------------
--	Spell: Protectra
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
   target:addStatusEffect(EFFECT_PROTECT,10,0,1800);
end;
