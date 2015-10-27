-----------------------------------------
-- ID: 18696
-- Item: Paralysis Arrow
-- Additional Effect: Paralysis (20 power)
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
    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,ELE_ICE,0) <= 0.5) then
        return 0,0,0;
    else
        target:delStatusEffect(EFFECT_PARALYSIS)
        if (not target:hasStatusEffect(EFFECT_PARALYSIS)) then
            target:addStatusEffect(EFFECT_PARALYSIS, 20, 0, 30);
        end
        return SUBEFFECT_PARALYSIS, MSGBASIC_ADD_EFFECT_STATUS, EFFECT_PARALYSIS;
    end
end;