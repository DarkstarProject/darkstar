-----------------------------------
-- Ability: Altruism
-- Increases the accuracy of your next White Magic spell.
-- Obtained: Scholar Level 75 Tier 2 Merit Points
-- Recast Time: Stratagem Charge
-- Duration: 1 white magic spell or 60 seconds, whichever occurs first
--
-- Level   |Charges |Recharge Time per Charge
-- -----   -------- ---------------
-- 10      |1       |4:00 minutes
-- 30      |2       |2:00 minutes
-- 50      |3       |1:20 minutes
-- 70      |4       |1:00 minute
-- 90      |5       |48 seconds
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    if player:hasStatusEffect(EFFECT_ALTRUISM) then
        return MSGBASIC_EFFECT_ALREADY_ACTIVE, 0;
    end
    return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    player:addStatusEffect(EFFECT_ALTRUISM,player:getMerit(MERIT_ALTRUISM),0,60);

    return EFFECT_ALTRUISM;
end;