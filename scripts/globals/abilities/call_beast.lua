-----------------------------------
-- Ability: Call Beast
-- Calls a beast to fight by your side.
-- Obtained: Beastmaster Level 23
-- Recast Time: 5:00
-- Duration: Dependent on jug pet used.
-----------------------------------

require("scripts/globals/common");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (player:getPet() ~= nil) then
        return MSGBASIC_ALREADY_HAS_A_PET,0;
    elseif (not player:hasValidJugPetItem()) then
        return MSGBASIC_NO_JUG_PET_ITEM,0;
    elseif (not player:canUsePet()) then
        return MSGBASIC_CANT_BE_USED_IN_AREA,0;
    else
        return 0,0;
    end
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    local id = player:getWeaponSubSkillType(SLOT_AMMO);
    if (id == 0) then
        printf("WARNING: jugpet id is ZERO\n");
    end

    player:spawnPet(id);
    player:removeAmmo();
end;
