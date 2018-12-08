-----------------------------------
-- Ability: Call Beast
-- Calls a beast to fight by your side.
-- Obtained: Beastmaster Level 23
-- Recast Time: 5:00
-- Duration: Dependent on jug pet used.
-----------------------------------
require("scripts/globals/common")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (player:getPet() ~= nil) then
        return dsp.msg.basic.ALREADY_HAS_A_PET,0
    elseif (not player:hasValidJugPetItem()) then
        return dsp.msg.basic.NO_JUG_PET_ITEM,0
    elseif (not player:canUseMisc(dsp.zoneMisc.PET)) then
        return dsp.msg.basic.CANT_BE_USED_IN_AREA,0
    else
        return 0,0
    end
end

function onUseAbility(player,target,ability)
    local id = player:getWeaponSubSkillType(dsp.slot.AMMO)
    if (id == 0) then
        printf("WARNING: jugpet id is ZERO\n")
    end

    player:spawnPet(id)
    player:removeAmmo()
end
