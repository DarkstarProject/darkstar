-----------------------------------------
-- ID: 5165
-- Item: Bottle of Movalpolos Water
-- Item Effect: Refresh 2 MP 3/Tic under 85% MP.
-- Duration: 30 Mins
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    local mMP = target:getMaxMP();
    local cMP = target:getMP();
    if (VanadielDayElement() == LIGHTDAY) then
        if (cMP < (mMP * .85)) then
            if (not target:hasStatusEffect(EFFECT_REFRESH)) then
                target:addStatusEffect(EFFECT_REFRESH,2,3,1800);
            else
                target:messageBasic(msgBasic.NO_EFFECT);
            end
        else
            target:messageBasic(msgBasic.NO_EFFECT);
        end
    else
        target:messageBasic(msgBasic.NO_EFFECT);
    end
end;
