-----------------------------------
-- Ability: Boost
-- Enhances user's next attack.
-- Obtained: Monk Level 5
-- Recast Time: 0:15
-- Duration: 3:00
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0;
end;

function onUseAbility(player,target,ability)
    local power = 12.5 + (0.10 * player:getMod(MOD_BOOST_EFFECT));

    if (player:hasStatusEffect(EFFECT_BOOST) == true) then
        local effect = player:getStatusEffect(EFFECT_BOOST);
        effect:setPower(effect:getPower() + power);
        player:addMod(MOD_ATTP,power);
    else
        player:addStatusEffect(EFFECT_BOOST,power,1,180);
    end
end;