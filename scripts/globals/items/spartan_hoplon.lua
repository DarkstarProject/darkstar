-----------------------------------------
-- ID: 15170
-- Item: Spartan Hoplon
-- Item Effect: Phalanx
-----------------------------------------

require("scripts/globals/settings");

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
    if (target:addStatusEffect(EFFECT_PHALANX,10,0,180)) then -- Retail potency unknown, 10 is a guess. (someone 1000 needles test this thing!)
        target:messageBasic(205,EFFECT_PHALANX);
    else
        target:messageBasic(423); -- no effect
    end
end;
