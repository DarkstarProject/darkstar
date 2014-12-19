-----------------------------------------
-- ID: 18150
-- Item: Blind Bolt
-- Additional Effect: Blind
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------
function onAdditionalEffect(player,target,damage)
    local chance = 95;
    if (target:getMainLvl() > player:getMainLvl()) then
        chance = chance - 5 * (target:getMainLvl() - player:getMainLvl())
        chance = utils.clamp(chance, 5, 95);
    end
    if (math.random(0,99) >= chance) then
        return 0,0,0;
    else
        target:delStatusEffect(EFFECT_BLINDNESS)
        if (not target:hasStatusEffect(EFFECT_BLINDNESS)) then
            target:addStatusEffect(EFFECT_BLINDNESS, 1, 0, 60);
        end
        return SUBEFFECT_BLIND, 160, EFFECT_BLINDNESS;
    end
end;