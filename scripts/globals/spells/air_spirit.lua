-----------------------------------------	
-- Spell: AirSpirit
-- Summons AirSpirit to fight by your side
-----------------------------------------

require("scripts/globals/pets");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	caster:spawnPet(PET_AIR_SPIRIT);
	return 0;
end;