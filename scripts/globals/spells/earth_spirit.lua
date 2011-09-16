-----------------------------------------
--	
--	Spell: EarthSpirit
--	Summons EarthSpirit to fight by your side
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	caster:spawnPet(3);
	return 0;
end;