-----------------------------------------
--	Spell: Haste
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
   target:addStatusEffect(EFFECT_HASTE,40,0,300);
end;