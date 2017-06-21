-----------------------------------------
--    ID: 4202
--    Daedalus Wing
--    Increases TP of the user by 100
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
    target:addTP(1000);
end;