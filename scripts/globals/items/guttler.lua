-----------------------------------------
-- ID: 18288
-- Item: Guttler
-- Additional Effect: Choke
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
        target:delStatusEffect(EFFECT_CHOKE)
        if (not target:hasStatusEffect(EFFECT_CHOKE)) then
            target:addStatusEffect(EFFECT_CHOKE, 17, 0, 60);
        end
        return SUBEFFECT_CHOKE, 160, EFFECT_CHOKE;
    end
end;