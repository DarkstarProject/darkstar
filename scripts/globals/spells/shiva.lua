-----------------------------------------
-- Spell: Shiva
-- Summons Shiva to fight by your side
-----------------------------------------

require("scripts/globals/pets");
require("scripts/globals/summon");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	if (not caster:canUsePet()) then
		return MSGBASIC_CANT_BE_USED_IN_AREA;
    elseif (caster:getObjType() == TYPE_PC) then
		return avatarMiniFightCheck(caster);
    elseif (caster:hasPet()) then
        return 1;
	end
	return 0;
end;

function onSpellCast(caster,target,spell)
	caster:spawnPet(PET_SHIVA);

	return 0;
end;
