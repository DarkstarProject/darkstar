-----------------------------------------
--	
--	Spell: Fenrir
--	Summons Fenrir to fight by your side
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	caster:spawnPet(9);
	return 0;
end;