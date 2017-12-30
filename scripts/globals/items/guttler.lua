-----------------------------------------
-- ID: 18288
-- Item: Guttler
-- Additional Effect: Choke
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 10;

    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,ELE_ICE,0) <= 0.5) then
        return 0,0,0;
    else
        target:addStatusEffect(EFFECT_CHOKE, 17, 0, 60);
        return SUBEFFECT_CHOKE, msgBasic.ADD_EFFECT_STATUS, EFFECT_CHOKE;
    end
end;