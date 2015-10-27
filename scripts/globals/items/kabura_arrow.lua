-----------------------------------------
-- ID: 17325
-- Item: Kabura Arrow
-- Additional Effect: Silence
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
    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,ELE_WIND,0) <= 0.5) then
        return 0,0,0;
    else
        target:delStatusEffect(EFFECT_SILENCE)
        if (not target:hasStatusEffect(EFFECT_SILENCE)) then
            target:addStatusEffect(EFFECT_SILENCE, 1, 0, 60);
        end
        return SUBEFFECT_SILENCE, MSGBASIC_ADD_EFFECT_STATUS, EFFECT_SILENCE;
    end
end;