-----------------------------------------
-- ID: 14493
-- Item: Healing Vest
-- Item Effect: Restores 90-105 HP
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
    local hpHeal = math.random(90,105);

    local dif = target:getMaxHP() - target:getHP();
    if (hpHeal > dif) then
        hpHeal = dif;
    end
    target:addHP(hpHeal);
    target:messageBasic(263,0,hpHeal);
end;