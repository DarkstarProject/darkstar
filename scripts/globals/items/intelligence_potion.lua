-----------------------------------------
--  ID: 4207
--  Item: Intelligence Potion
--  Intelligence 7
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    if (target:hasStatusEffect(EFFECT.MEDICINE)) then
        return msgBasic.ITEM_NO_USE_MEDICATED;
    end
    return 0;
end;

function onItemUse(target)
    target:addStatusEffect(EFFECT.INT_BOOST,7,0,180);
    target:addStatusEffect(EFFECT.MEDICINE,0,0,900);
end;
