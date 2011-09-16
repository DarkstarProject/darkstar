-----------------------------------------
--	
--	Spell: FireSpirit
--	Summons FireSpirit to fight by your side
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	caster:spawnPet(0);
	return 0;
end;