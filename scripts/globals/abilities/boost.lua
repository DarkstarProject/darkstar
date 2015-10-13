-----------------------------------
-- Ability: Boost
-- Enhances user's next attack.
-- Obtained: Monk Level 5
-- Recast Time: 0:15
-- Duration: 3:00
-----------------------------------

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
    local sHands = player:getEquipID(SLOT_HANDS);
    local power = 12.5
    if (sHands == 13962 or sHands == 14891) then
        power = power + 5.5;
    end

    if (player:hasStatusEffect(EFFECT_BOOST) == true) then
        local effect = player:getStatusEffect(EFFECT_BOOST);
        effect:setPower(effect:getPower() + power);
        player:addMod(MOD_ATTP,power);
    else
        player:addStatusEffect(EFFECT_BOOST,power,1,180);
    end
end;