-----------------------------------
-- Ability: Gauge
-- Checks to see if an enemy can be charmed.
-- Obtained: Beastmaster Level 10
-- Recast Time: 0:30
-- Duration: Instant
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player, target, ability)
    if (player:getPet() ~= nil ) then
        return MSGBASIC_ALREADY_HAS_A_PET,0;
    else
        return 0,0;
    end
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player, target, ability)

    local charmChance = player:getCharmChance(target, false);
    
    if (charmChance >= 75) then
        ability:setMsg(MSGBASIC_SHOULD_BE_ABLE_CHARM);  -- The <player> should be able to charm <target>.
    elseif (charmChance >= 50) then
        ability:setMsg(MSGBASIC_MIGHT_BE_ABLE_CHARM);   -- The <player> might be able to charm <target>.
    elseif (charmChance >= 25) then
        ability:setMsg(MSGBASIC_DIFFICULT_TO_CHARM);    -- It would be difficult for the <player> to charm <target>.
    elseif (charmChance >= 1) then
        ability:setMsg(MSGBASIC_VERY_DIFFICULT_CHARM);  -- It would be very difficult for the <player> to charm <target>.
    else
        ability:setMsg(MSGBASIC_CANNOT_CHARM);          -- The <player> cannot charm <target>!
    end

end;
