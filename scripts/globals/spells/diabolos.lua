-----------------------------------------
--	
--	Spell: Diabolos
--	Summons Diabolos to fight by your side
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	caster:spawnPet(16);
	return 0;
end;