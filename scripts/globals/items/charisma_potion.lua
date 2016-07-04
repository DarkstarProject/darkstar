-----------------------------------------
--  ID: 4211
--  Item: Charisma Potion
-----------------------------------------
--  Charisma 7
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
    target:addStatusEffect(EFFECT_CHR_BOOST,7,0,180);
    target:addStatusEffect(EFFECT_MEDICINE,0,0,900);
end;