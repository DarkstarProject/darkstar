-----------------------------------
-- Ability: Chivalry
-- Converts TP to MP.
-- Obtained: Paladin Level 75 (Must be Purchased with Merit Points)
-- Recast Time: 0:10:00 (+5% MP granted per additional upgrade)
-- Duration: Instant
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    local merits = player:getMerit(MERIT_CHIVALRY);
    local tp = target:getTP()
--(TP * .5) + ((0.015 * TP) * MND) = MP Gained
    local amount = ((tp*(0.05)) + ((0.0015*tp) * target:getStat(MOD_MND))) * ((100 + merits - 5) / 100)
    target:setTP(0);
    return target:addMP(amount);
end;