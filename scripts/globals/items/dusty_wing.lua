-----------------------------------------
--    ID: 5440
--    Dusty Wing
--    Increases TP of the user by 300
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
    target:addTP(300);
end;