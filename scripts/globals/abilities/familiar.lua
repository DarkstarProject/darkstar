-----------------------------------
-- Ability: Familiar
-- Enhances your pet's powers and increases the duration of Charm.
-- Obtained: Beastmaster Level 1
-- Recast Time: 1:00:00
-- Duration: 0:30:00
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (player:getPet() == nil) then
        return MSGBASIC_REQUIRES_A_PET,0;
    end

   return 0,0;
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
