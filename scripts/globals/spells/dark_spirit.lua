-----------------------------------------
-- Spell: DarkSpirit
-- Summons DarkSpirit to fight by your side
-----------------------------------------

require("scripts/globals/pets");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	caster:spawnPet(PET_DARK_SPIRIT);
	return 0;
end;