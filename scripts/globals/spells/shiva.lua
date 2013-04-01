-----------------------------------------
-- Spell: Shiva
-- Summons Shiva to fight by your side
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
	caster:spawnPet(PET_SHIVA);

	return 0;
end;