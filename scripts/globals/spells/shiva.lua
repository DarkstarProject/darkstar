-----------------------------------------
--	
--	Spell: Shiva
--	Summons Shiva to fight by your side
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	caster:spawnPet(14);
	return 0;
end;