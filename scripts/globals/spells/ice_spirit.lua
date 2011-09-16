-----------------------------------------
--	
--	Spell: IceSpirit
--	Summons IceSpirit to fight by your side
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	caster:spawnPet(1);
	return 0;
end;