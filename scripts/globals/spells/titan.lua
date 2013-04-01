-----------------------------------------
-- Spell: Titan
-- Summons Titan to fight by your side
-----------------------------------------

require("scripts/globals/pets");
require("scripts/globals/summon");
require("scripts/globals/bcnm");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return avatarMiniFightCheck(caster);
end;

function onSpellCast(caster,target,spell)
	caster:spawnPet(PET_TITAN);

	return 0;
end;