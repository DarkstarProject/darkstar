-----------------------------------
-- Ability: Familiar
-- Enhances your pet's powers and increases the duration of Charm.
-- Obtained: Beastmaster Level 1
-- Recast Time: 1:00:00
-- Duration: 0:30:00
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    local pet = player:getPet();
    if not pet then
        return msgBasic.REQUIRES_A_PET,0;
    elseif not player:isJugPet() and pet:getObjType() ~= TYPE_MOB then
        return msgBasic.NO_EFFECT_ON_PET,0;
    else
        return 0,0;
    end
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    player:familiar();

    -- pets powers increase!
    ability:setMsg(108);

    return 0;
end;
