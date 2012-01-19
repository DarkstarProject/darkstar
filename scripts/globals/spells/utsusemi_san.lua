-----------------------------------------
--	
--	Spell: Titan
--	Summons Titan to fight by your side
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	caster:addStatusEffect(EFFECT_COPY_IMAGE_4,5,0,300);
	return 0;
end;