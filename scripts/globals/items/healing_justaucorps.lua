-----------------------------------------
-- ID: 14496
-- Item: Healing Justaucorps
-- Item Effect: Restores 150-175 HP
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
    local hpHeal = math.random(150,175);

    local dif = target:getMaxHP() - target:getHP();
    if (hpHeal > dif) then
        hpHeal = dif;
    end
    target:addHP(hpHeal);
    target:messageBasic(263,0,hpHeal); 
end;