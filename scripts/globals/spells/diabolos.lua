-----------------------------------------
-- Spell: Diabolos
-- Summons Diabolos to fight by your side
-----------------------------------------

require("scripts/globals/pets");
require("scripts/globals/summon");
require("scripts/globals/bcnm");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	if (not caster:canUsePet()) then
		return MSGBASIC_CANT_BE_USED_IN_AREA;
    elseif (caster:getObjType() == TYPE_PC) then
		return avatarMiniFightCheck(caster);
	end
	return 0;
end;

function onSpellCast(caster,target,spell)
	caster:spawnPet(PET_DIABOLOS);

	return 0;
end;