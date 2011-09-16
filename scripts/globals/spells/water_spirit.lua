-----------------------------------------
--	
--	Spell: WaterSpirit
--	Summons WaterSpirit to fight by your side
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	caster:spawnPet(5);
	return 0;
end;