-----------------------------------------
--	
--	Spell: Garuda
--	Summons Garuda to fight by your side
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	caster:spawnPet(13);
	return 0;
end;