-----------------------------------------
--	Spell: Sneak
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
   target:addStatusEffect(EFFECT_SNEAK,0,10,300);
end;
