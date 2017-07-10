-----------------------------------------
--  ID: 4261
--  Item: Yellow Drop
-----------------------------------------
--  Charisma 5
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(EFFECT_MEDICINE)) then
        result = 111;
    end
    return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_VIT_BOOST,5,0,900);
    target:addStatusEffect(EFFECT_MEDICINE,0,0,3600);
end;