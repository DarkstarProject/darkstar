-----------------------------------------
-- ID: 15533
-- Item: Chocobo Whistle
-- 
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    return target:canUseChocobo();
end;

function onItemUse(target)
    if (target:getMainLvl() >= 20) then
        target:addStatusEffectEx(dsp.effects.MOUNTED,dsp.effects.MOUNTED,0,0,1800,true);
    else
        target:addStatusEffectEx(dsp.effects.MOUNTED,dsp.effects.MOUNTED,0,0,900,true);
    end
end;
