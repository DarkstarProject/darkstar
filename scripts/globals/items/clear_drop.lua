-----------------------------------------
--  ID: 4259
--  Item: Clear Drop
-----------------------------------------
--  Intelligence 5
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
    target:addStatusEffect(EFFECT_INT_BOOST,5,0,600);
    target:addStatusEffect(EFFECT_MEDICINE,0,0,3600);
end;