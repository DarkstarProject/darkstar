-----------------------------------------
-- ID: 15372
-- Item: Magic Slacks
-- Item Effect: Restores 30-39 MP
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
    local hpHeal = math.random(30,40);

    local dif = target:getMaxMP() - target:getMP();
    if (hpHeal > dif) then
        hpHeal = dif;
    end
    target:addMP(hpHeal);
    target:messageBasic(276,0,hpHeal);
end;