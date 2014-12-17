-----------------------------------
-- Ability: Collaborator
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (target == nil or target:getID() == player:getID() or not target:isPC()) then
		return MSGBASIC_CANNOT_ON_THAT_TARG, 0;
    else
        return 0, 0;
    end
end;

function onUseAbility(player, target, ability)
end;
