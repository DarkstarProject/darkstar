-----------------------------------------
--	
--	Spell: Titan
--	Summons Titan to fight by your side
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	caster:spawnPet(11);
	return 0;
end;