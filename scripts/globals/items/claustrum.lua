-----------------------------------------
-- ID: 18330
-- Item: Claustrum
-- Additional Effect: Dispel
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 15;
    if (chance > math.random(0,99)) then
        local dispel = target:dispelStatusEffect();
        if (dispel == EFFECT_NONE) then
            return 0,0,0;
        else
            return SUBEFFECT_DISPEL, msgBasic.ADD_EFFECT_DISPEL, dispel;
        end
    else
        return 0,0,0;
    end
end;