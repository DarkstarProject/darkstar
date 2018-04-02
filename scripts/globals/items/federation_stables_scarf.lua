-----------------------------------------
-- ID: 13181
-- Item: Federation Stables Scarf
-- Teleports to Chocobo Stables (Windurst)
-----------------------------------------

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    target:setPos(114.908,-5.000,-133.766,0,241);  -- Guess based on other two until retail confirm
end;
