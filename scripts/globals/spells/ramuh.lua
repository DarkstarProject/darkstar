-----------------------------------------
-- Spell: Ramuh
-- Summons Ramuh to fight by your side
-----------------------------------------

require("scripts/globals/pets");
require("scripts/globals/summon");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    if (not caster:canUsePet()) then
        return MSGBASIC_CANT_BE_USED_IN_AREA;
    elseif (caster:hasPet()) then
        return MSGBASIC_ALREADY_HAS_A_PET;
    elseif (caster:getObjType() == TYPE_PC) then
        return avatarMiniFightCheck(caster);
    end
    return 0;
end;

function onSpellCast(caster,target,spell)
    caster:spawnPet(PET_RAMUH);

    return 0;
end;
