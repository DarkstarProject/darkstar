-----------------------------------------
--	
--	Spell: LightSpirit
--	Summons LightSpirit to fight by your side
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	caster:spawnPet(6);
	return 0;
end;