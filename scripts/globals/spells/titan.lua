-----------------------------------------
--	
--	Spell: Titan
--	Summons Titan to fight by your side
-----------------------------------------

require("scripts/globals/pets");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	caster:spawnPet(PET_TITAN);
	return 0;
end;