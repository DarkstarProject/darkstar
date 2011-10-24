-----------------------------------------
--	
--	Spell: Titan
--	Summons Titan to fight by your side
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	caster:addStatusEffect(EFFECT_COPY_IMAGE_1,3,0,300);
end;