-----------------------------------------
--  ID: 4264
--  Item: White Drop
--  Charisma 5
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
    target:addStatusEffect(EFFECT.CHR_BOOST,5,0,900);
    target:addStatusEffect(EFFECT.MEDICINE,0,0,3600);
end;
