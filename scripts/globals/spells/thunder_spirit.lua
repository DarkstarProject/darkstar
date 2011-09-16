-----------------------------------------
--	
--	Spell: ThunderSpirit
--	Summons ThunderSpirit to fight by your side
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	caster:spawnPet(4);
	return 0;
end;