-----------------------------------------
-- Spell: ThunderSpirit
-- Summons ThunderSpirit to fight by your side
-----------------------------------------

require("scripts/globals/pets");
require("scripts/globals/summon");
require("scripts/globals/bcnm");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	local result = 0;
	if(caster:getObjType() == TYPE_PC) then
		result = avatarMiniFightCheck(caster);
	end
    if(caster:hasPet()) then
        result = 1;
    end
	return result;
end;

function onSpellCast(caster,target,spell)
	caster:spawnPet(PET_THUNDER_SPIRIT);

	return 0;
end;
