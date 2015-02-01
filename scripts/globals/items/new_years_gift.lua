-----------------------------------------
-- ID: 4176
-- Item: New Years Gift
-- Enchantment: ??? Random 
-- Durration: 10 Mins - 2 Hrs
-----------------------------------------

require("scripts/globals/settings");
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
	local var = math.random(1,4);
	if (var == 1) then
		if (target:hasStatusEffect(EFFECT_RERAISE) == false) then
			target:addStatusEffect(EFFECT_RERAISE,1,0,3600);
		end
	elseif (var == 2) then
		if (target:hasStatusEffect(EFFECT_ENBLIZZARD) == false) then
			target:addStatusEffect(EFFECT_ENBLIZZARD,35,0,600);
		end
	elseif (var == 3) then
		if (target:hasStatusEffect(EFFECT_ICE_SPIKES) == false) then
			target:addStatusEffect(EFFECT_ICE_SPIKES,35,0,600);
		end
	elseif (var == 4) then
		if (target:hasStatusEffect(EFFECT_BLINK) == false) then
			target:addStatusEffect(EFFECT_FISHING_IMAGERY,0,0,7200);
		end
	end;
end;
