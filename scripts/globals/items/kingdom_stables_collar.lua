-----------------------------------------
-- ID: 13179
-- Item: Kingdom Stables Collar
-- Teleports to Chocobo Stables (San d'Oria)
-----------------------------------------

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    target:setPos(-8.557,1.999,-80.093,64,230);  -- {R}
end;
