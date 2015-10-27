-----------------------------------------
-- ID: 18159
-- Item: Demon Arrow
-- Additional Effect: 12% Attack Down
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
    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,ELE_WATER,0) <= 0.5) then
        return 0,0,0;
    else
        target:delStatusEffect(EFFECT_ATTACK_DOWN)
        if (not target:hasStatusEffect(EFFECT_ATTACK_DOWN)) then
            target:addStatusEffect(EFFECT_ATTACK_DOWN, 12, 0, 60);
        end
        return SUBEFFECT_DEFENSE_DOWN, MSGBASIC_ADD_EFFECT_STATUS, EFFECT_ATTACK_DOWN;
    end
end;