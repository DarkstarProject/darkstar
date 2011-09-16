-----------------------------------------
--	
--	Spell: Ifrit
--	Summons Ifrit to fight by your side
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	caster:spawnPet(10);
	return 0;
end;