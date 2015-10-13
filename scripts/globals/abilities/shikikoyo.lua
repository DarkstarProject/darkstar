-----------------------------------
-- Ability: Shikikoyo
-- Share TP above 100 with a party member.
-- Obtained: Samurai Level 75
-- Recast Time: 5:00
-- Duration: Instant
-- Target: Party member, cannot target self.
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/utils");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (player:getID() == target:getID()) then
        return MSGBASIC_CANNOT_PERFORM_TARG,0;
    elseif (player:getTP() < 100) then
        return MSGBASIC_NOT_ENOUGH_TP, 0;
    else
        return 0,0;
    end
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    local pTP = player:getTP() - 100 + (player:getMerit(MERIT_SHIKIKOYO) - 12);
    pTP = utils.clamp(pTP, 0,300 - target:getTP());

    player:setTP(100);
    target:setTP(target:getTP() + pTP);

    return pTP;
end;