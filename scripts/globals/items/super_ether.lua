-----------------------------------------
-- ID: 4136
-- Item: Super Ether
-- Item Effect: Restores 100 MP
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
    target:messageBasic(25,0,target:addMP(100*ITEM_POWER));
end;
