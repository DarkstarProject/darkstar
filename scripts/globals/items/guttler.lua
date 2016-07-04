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

    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,ELE_ICE,0) <= 0.5) then
        return 0,0,0;
    else
        target:addStatusEffect(EFFECT_CHOKE, 17, 0, 60);
        return SUBEFFECT_CHOKE, MSGBASIC_ADD_EFFECT_STATUS, EFFECT_CHOKE;
    end
end;