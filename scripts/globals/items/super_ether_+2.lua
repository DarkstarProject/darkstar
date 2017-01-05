-----------------------------------------
-- ID: 4138
-- Item: Super Ether +2
-- Item Effect: Restores 110 MP
-----------------------------------------

require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    local mMP = target:getMaxMP();
    local cMP = target:getMP();

    if (mMP == cMP) then
        result = 56; -- Does not let player use item if their hp is full
    end

    return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:messageBasic(25,0,target:addMP(110*ITEM_POWER));
end;