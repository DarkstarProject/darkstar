-----------------------------------------
--	
--	Spell: Ramuh
--	Summons Ramuh to fight by your side
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	caster:spawnPet(15);
	return 0;
end;