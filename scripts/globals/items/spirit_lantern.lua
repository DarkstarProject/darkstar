-----------------------------------------
-- ID: 18240
-- Item: Spirit Lantern
-- Enchantment: Elemental Magic Dmg +10%
-- Charges: 20	Reuse Delay: 30 Mins
-- Duration: 5 Mins
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	-- return 0;
	return 56;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	-- if (target:hasStatusEffect(EFFECT_ENCHANTMENT) == false) then
		-- target:addStatusEffect(EFFECT_ENCHANTMENT,0,0,300,18240);
	-- end;
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
	-- MOD_ELEM_MAG_DMG DOES NOT EXIST YET SO WHY IS THIS HERE, WAITING TO CRASH THE SERVER?
	-- target:addMod(MOD_ELEM_MAG_DMG, 10);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	-- target:delMod(MOD_ELEM_MAG_DMG, 10);
end;