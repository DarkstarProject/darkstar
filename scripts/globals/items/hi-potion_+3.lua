-----------------------------------------
-- ID: 4119
-- Item: Hi-Potion +3
-- Item Effect: Restores 130 HP
-----------------------------------------

require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    local value = 0;
    local mHP = target:getMaxHP();
    local cHP = target:getHP();

    if (mHP == cHP) then
        value = 56; -- Does not let player use item if their hp is full
    end

    return value;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:messageBasic(24,0,target:addHP(130*ITEM_POWER));
end;