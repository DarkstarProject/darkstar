-----------------------------------------
--  ID: 26720
--  Sheep Cap +1
--  When used, you will obtain one of eleven random items. They are:
--  Faerie Apple, Sunflower Seeds, Red Moko Grass, La Theine Cabbage, Boyahda Moss,
--  Pine Nuts, Beaugreens, Acorn, Dung, Batagreens, and Moko Grass
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
    local giftList = {4363,4505,1845,4366,919,2213,4571,4504,8929,4367,833}
    local gift = math.random(1,11);
    target:addItem(giftList[gift]);
end;