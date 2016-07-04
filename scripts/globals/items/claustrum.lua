-----------------------------------------
-- ID: 18330
-- Item: Claustrum
-- Additional Effect: Dispel
-----------------------------------------
require("scripts/globals/status");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    chance = 15;
    if (chance > math.random(0,99)) then
        local dispel = target:dispelStatusEffect();
        if (dispel == EFFECT_NONE) then
            return 0,0,0;
        else
            return SUBEFFECT_DISPEL, MSGBASIC_ADD_EFFECT_DISPEL, dispel;
        end
    else
        return 0,0,0;
    end
end;