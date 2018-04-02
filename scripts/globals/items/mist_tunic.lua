-----------------------------------------
-- ID: 15526
-- Item: Mist Slacks
-- Item Effect: Evasion Boost
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    if (not target:hasStatusEffect(dsp.effects.EVASION_BOOST)) then
        target:addStatusEffect(dsp.effects.EVASION_BOOST,20,0,180);
    else
        target:messageBasic(msgBasic.NO_EFFECT);
    end
end;
