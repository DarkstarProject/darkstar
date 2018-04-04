-----------------------------------------
-- ID: 4166
-- Deodorizer
-- When applied, this powerful deodorant neutralizes even the strongest of odors!!.
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    if (not target:hasStatusEffect(dsp.effects.DEODORIZE)) then
        target:addStatusEffect(dsp.effects.DEODORIZE,1,10,180);
    else
        target:messageBasic(msgBasic.NO_EFFECT);
    end
end;
