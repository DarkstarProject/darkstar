-----------------------------------------
-- ID: 15560
-- Item: Trooper's Ring
-- Item Effect: Restores 100-115 HP
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
    local hpHeal = math.random(100,115);

    local dif = target:getMaxHP() - target:getHP();
    if (hpHeal > dif) then
        hpHeal = dif;
    end
    target:addHP(hpHeal);
    target:messageBasic(263,0,hpHeal);
end;