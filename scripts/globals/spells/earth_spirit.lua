-----------------------------------------
-- Spell: EarthSpirit
-- Summons EarthSpirit to fight by your side
-----------------------------------------

require("scripts/globals/pets");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	caster:spawnPet(PET_EARTH_SPIRIT);
	return 0;
end;