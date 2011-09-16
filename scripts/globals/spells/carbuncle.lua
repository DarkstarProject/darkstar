-----------------------------------------
--	
--	Spell: Carbuncle
--	Summons Carbuncle to fight by your side
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	caster:spawnPet(8);
	return 0;
end;