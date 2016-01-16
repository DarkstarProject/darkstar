-----------------------------------------
-- ID: 5410
-- virtue_stone_pouch.lua
-- When used, you will obtain one stack of virtue stone
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
local result = 0;
    if (target:getFreeSlotsCount() == 0) then
        result = 308;
    end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addItem(18244,99);
end;

