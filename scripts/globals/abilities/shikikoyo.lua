-----------------------------------
-- Ability: Shikikoyo
-- Share TP above 100 with a party member.
-- Obtained: Samurai Level 75
-- Recast Time: 5:00
-- Duration: Instant
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (player:getTP() < 100) then
        return MSGBASIC_NOT_ENOUGH_TP, 0;
    end
    return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    local pTP = player:getTP() - 100;

    if (pTP > 0) then
        player:setTP(100);
        target:setTP(target:getTP() + pTP + (player:getMerit(MERIT_SHIKIKOYO) - 12));
    end

end;