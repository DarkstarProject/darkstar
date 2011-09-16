-----------------------------------------
--	
--	Spell: DarkSpirit
--	Summons DarkSpirit to fight by your side
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	caster:spawnPet(7);
	return 0;
end;