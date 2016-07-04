-----------------------------------------
-- ID: 5165
-- Item: Bottle of Movalpolos Water
-- Item Effect: Refresh 2 MP 3/Tic under 85% MP.
-- Duration: 30 Mins
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
    local mMP = target:getMaxMP();
    local cMP = target:getMP();
    if (VanadielDayElement() == LIGHTDAY) then
        if (cMP < (mMP * .85)) then
            if (target:hasStatusEffect(EFFECT_REFRESH) == false) then
                target:addStatusEffect(EFFECT_REFRESH,2,3,1800);
            else
                target:messageBasic(423);
            end
        else
            target:messageBasic(423);
        end
    else
        target:messageBasic(423);
    end
end;

