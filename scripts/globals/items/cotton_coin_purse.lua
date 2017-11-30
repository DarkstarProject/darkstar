-----------------------------------------
--    ID: 5735
--    Cotton Coin Purse
--    Grants between 4-20 Alexandrite
-----------------------------------------

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

local quantity = math.random(4,20);

target:addItem( 2488, quantity);

end;