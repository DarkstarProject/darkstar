-----------------------------------------
--	
--	Spell: Leviathan
--	Summons Leviathan to fight by your side
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	caster:spawnPet(12);
	return 0;
end;