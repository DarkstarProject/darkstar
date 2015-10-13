-----------------------------------------
-- ID: 15526
-- Item: Mist Slacks
-- Item Effect: Evasion Boost
-----------------------------------------

require("scripts/globals/status");

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
    if (target:hasStatusEffect(EFFECT_EVASION_BOOST) == false) then
        target:addStatusEffect(EFFECT_EVASION_BOOST,20,0,180);
    else
        target:messageBasic(423);
    end
end;

