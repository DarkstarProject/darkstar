-----------------------------------------
--	Spell: Shell II
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
   target:addStatusEffect(EFFECT_SHELL,20,0,1800);
end;
