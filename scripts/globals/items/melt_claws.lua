-----------------------------------------
-- ID: 18357
-- Item: Melt Claws
-- Item Effect: Defense Down 20% on Target
-- Charges: 15  Duration: 90 Secs
-----------------------------------------

require("scripts/globals/status");
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
	if(target:hasStatusEffect(EFFECT_DEFENSE_DOWN) == false) then
		target:addStatusEffect(EFFECT_DEFENSE_DOWN,20,0,90);
	else
		target:messageBasic(423);
	end
end;

