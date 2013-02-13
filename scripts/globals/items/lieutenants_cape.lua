-----------------------------------------
-- ID: 14493
-- Item: Healing Vest
-- Item Effect: Restores 50% hp and 25% mp
-----------------------------------------

require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return 0;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addHP((target:getMaxHP()/100)*50);
    target:addMP((target:getMaxMP()/100)*25);
    target:messageBasic(26);
end;