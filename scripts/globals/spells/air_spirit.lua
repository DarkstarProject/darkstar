-----------------------------------------
--	
--	Spell: AirSpirit
--	Summons AirSpirit to fight by your side
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	caster:spawnPet(2);
	return 0;
end;