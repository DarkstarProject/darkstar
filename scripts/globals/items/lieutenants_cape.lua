-----------------------------------------
-- ID: 16230
-- Item: Lieutenant's Cape
-- Item Effect: Restores 50% hp and 25% mp
-----------------------------------------
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    target:addHP((target:getMaxHP()/100)*50);
    target:addMP((target:getMaxMP()/100)*25);
    target:messageBasic(msgBasic.RECOVERS_HP_AND_MP);
end;
