-----------------------------------------
-- ID: 15533
-- Item: Chocobo Whistle
-- 
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canUseChocobo();
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)    
    if (target:getMainLvl() >= 20) then
        target:addStatusEffectEx(EFFECT_CHOCOBO,EFFECT_CHOCOBO,0,0,1800,true);
    else
        target:addStatusEffectEx(EFFECT_CHOCOBO,EFFECT_CHOCOBO,0,0,900,true);
    end
end;