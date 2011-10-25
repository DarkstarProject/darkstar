-----------------------------------------
--	Spell: Haste
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
   target:addStatusEffect(EFFECT_HASTE,15,0,180);
end;