-----------------------------------------
-- Spell: WaterSpirit
-- Summons WaterSpirit to fight by your side
-----------------------------------------

require("scripts/globals/pets");
require("scripts/globals/summon");
require("scripts/globals/bcnm");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	local result = 0;
	if (caster:getObjType() == TYPE_PC) then
		result = avatarMiniFightCheck(caster);
	elseif (caster:hasPet()) then
        result = 1;
    elseif (not caster:canUsePet()) then
		result = MSGBASIC_CANT_BE_USED_IN_AREA;
    end
	return result;
end;

function onSpellCast(caster,target,spell)
	caster:spawnPet(PET_WATER_SPIRIT);

	return 0;
end;