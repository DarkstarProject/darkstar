-----------------------------------------
<<<<<<< HEAD
-- ID: 18150
-- Item: Blind Bolt
-- Additional Effect: Blindness
=======
-- ID: 18148
-- Item: Acid Bolt
-- Additional Effect: Weakens Defense
>>>>>>> 31fb2f69b784ad1c7bbd59f39f0b5ec146d87b53
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
    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,ELE_DARK,0) <= 0.5) then
        return 0,0,0;
    else
        target:delStatusEffect(EFFECT_BLINDNESS)
        if (not target:hasStatusEffect(EFFECT_BLINDNESS)) then
            target:addStatusEffect(EFFECT_BLINDNESS, 10, 0, 30);
        end
        return SUBEFFECT_BLIND, 160, EFFECT_BLINDNESS;
    end
end;
