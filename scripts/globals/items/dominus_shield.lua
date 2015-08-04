-----------------------------------------
-- ID: 14491
-- Item: Dominus Shield
-- Item Effect: Restores 20-35 MP
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
    local mpHeal = math.random(60,85);

    local dif = target:getMaxMP() - target:getMP();
    if (mpHeal > dif) then
        mpHeal = dif;
    end
    target:addMP(mpHeal);
    target:messageBasic(276,0,mpHeal);
end;