-----------------------------------------
-- ID: 18312
-- Item: Kikoku
-- Additional Effect: Paralysis
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------
function onAdditionalEffect(player,target,damage)
    local chance = 10;
    if (target:getMainLvl() > player:getMainLvl()) then
        chance = chance - 5 * (target:getMainLvl() - player:getMainLvl())
        chance = utils.clamp(chance, 5, 95);
    end
    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,ELE_ICE,0) <= 0.5) then
        return 0,0,0;
    else
        target:delStatusEffect(EFFECT_PARALYSIS)
        if (not target:hasStatusEffect(EFFECT_PARALYSIS)) then
            target:addStatusEffect(EFFECT_PARALYSIS, 15, 0, 30);
        end
        return SUBEFFECT_PARALYSIS, 160, EFFECT_PARALYSIS;
    end
end;