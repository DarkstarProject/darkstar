-----------------------------------------
-- ID: 18157
-- Item: Poison Arrow
-- Additional Effect: Poison
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
    if (target:hasImmunity(256)) then
        spell:setMsg(75);
    elseif (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,ELE_WATER,0) <= 0.5) then
        return 0,0,0;
    else
        target:delStatusEffect(EFFECT_POISON)
        if (not target:hasStatusEffect(EFFECT_POISON)) then
            target:addStatusEffect(EFFECT_POISON, 4, 3, 30);
        end
        return SUBEFFECT_POISON, MSGBASIC_ADD_EFFECT_STATUS, EFFECT_POISON;
    end
end;
