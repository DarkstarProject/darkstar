-----------------------------------------
--	Spell: Utsusemi: Ichi
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	target:addStatusEffect(EFFECT_COPY_IMAGE,3,0,300);
end;