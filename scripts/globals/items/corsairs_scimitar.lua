-----------------------------------------
-- ID: 17737
-- Item: Corsair's Scimitar
-- Additional Effect: Paralysis
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------
function onAdditionalEffect(player,target,damage)
    local chance = math.random(1,100)


    if (chance >= 9)then
        return 0,0,0;
    else
        target:delStatusEffect(EFFECT_PARALYSIS)
        if (not target:hasStatusEffect(EFFECT_PARALYSIS)) then
            target:addStatusEffect(EFFECT_PARALYSIS, 25, 0, 15);
        end
 return SUBEFFECT_PARALYSIS, 160, EFFECT_PARALYSIS;
    end
end;