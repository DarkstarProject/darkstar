-----------------------------------------
-- Spell: FireSpirit
-- Summons FireSpirit to fight by your side
-----------------------------------------
require("scripts/globals/summon");
require("scripts/globals/bcnm");
require("scripts/globals/pets");
require("scripts/globals/msg");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    local result = 0;
    if (caster:hasPet()) then
        result = msgBasic.ALREADY_HAS_A_PET;
    elseif (not caster:canUsePet()) then
        result = msgBasic.CANT_BE_USED_IN_AREA;
    elseif (caster:getObjType() == TYPE_PC) then
        result = avatarMiniFightCheck(caster);
    end
    return result;
end;

function onSpellCast(caster,target,spell)
    caster:spawnPet(PET_FIRE_SPIRIT);

    return 0;
end;
