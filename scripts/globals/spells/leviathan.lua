-----------------------------------------
--	
--	Spell: Leviathan
--	Summons Leviathan to fight by your side
-----------------------------------------

require("scripts/globals/pets");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	caster:spawnPet(PET_LEVIATHAN);
	return 0;
end;