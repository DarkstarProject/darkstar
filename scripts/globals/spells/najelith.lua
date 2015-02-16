-----------------------------------------
-- Spell: Fenrir
-- Summons Fenrir to fight by your side
-----------------------------------------

require("scripts/globals/pets");
require("scripts/globals/summon");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	return 1;
end;

function onSpellCast(caster,target,spell)
	caster:spawnPet(PET_GENERAL_NAJELITH);

	return 0;
end;