-----------------------------------------
-- Spell: Ramuh
-- Summons Ramuh to fight by your side
-----------------------------------------

require("scripts/globals/pets");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	caster:spawnPet(PET_RAMUH);
	return 0;
end;