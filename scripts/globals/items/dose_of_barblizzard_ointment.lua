-----------------------------------------
-- ID: 5248
-- Item: Dose of Barblizzard Ointment
-- Item Effect: Ice Resistance +20 ?
-- Duration: 5 Mins ?
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	result = 0;
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    if(target:addStatusEffect(EFFECT_BARBLIZZARD,20,0,300,0,1);) then
        target:messageBasic(205);
    else
        target:messageBasic(423); -- no effect
    end
    return EFFECT_BARBLIZZARD;
end;
