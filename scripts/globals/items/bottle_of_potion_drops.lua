-----------------------------------------
-- ID: 5327
-- Item: Potion Drop
-- Item Effect: Restores 60 HP
-----------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    if (target:hasStatusEffect(EFFECT_MEDICINE)) then
        return msgBasic.ITEM_NO_USE_MEDICATED;
    end
    return 0;
end;

function onItemUse(target)
    target:addHP(60*ITEM_POWER);
    target:addStatusEffect(EFFECT_MEDICINE,0,0,300);
end;
