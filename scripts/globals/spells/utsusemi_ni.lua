-----------------------------------------
--	Spell: Utsusemi: Ni
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	target:addStatusEffect(EFFECT_COPY_IMAGE,4,0,300);
end;