-----------------------------------------
-- ID: 4138
-- Item: Super Ether +2
-- Item Effect: Restores 110 MP
-----------------------------------------
require("scripts/globals/settings");
require("scripts/globals/msg");

function onItemCheck(target)
    if (target:getMP() == target:getMaxMP()) then
        return msgBasic.ITEM_UNABLE_TO_USE;
    end
    return 0;
end;

function onItemUse(target)
    target:messageBasic(msgBasic.RECOVERS_MP,0,target:addMP(110*ITEM_POWER));
end;
