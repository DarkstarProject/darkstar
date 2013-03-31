-----------------------------------
-- Ability: Assault
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
    if (player:getPet() == nil) then
        return MSGBASIC_REQUIRES_A_PET,0;
    end

   return 0,0;
end;

function OnUseAbility(player, target, ability)
    player:familiar();

    -- pets powers increase!
    ability:setMsg(108);

    return 0;
end;
