-----------------------------------------
-- Spell: FireSpirit
-- Summons FireSpirit to fight by your side
-----------------------------------------

require("scripts/globals/pets");
require("scripts/globals/summon");
require("scripts/globals/bcnm");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	local result = avatarMiniFightCheck(caster);
    if(caster:hasPet()) then
        result = 1;
    end
	return result;
end;

function onSpellCast(caster,target,spell)
	caster:spawnPet(PET_FIRE_SPIRIT);

	return 0;
end;