-----------------------------------------
-- ID: 17116
-- Item: Misery Staff
-- Additional Effect: Curse
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 10;

    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,ELE_DARK,0) <= 0.5) then
        return 0,0,0;
    else
        target:addStatusEffect(EFFECT_CURSE_I, 5, 0, 30);
        return SUBEFFECT_CURSE, 160, EFFECT_CURSE_I;
    end
end;