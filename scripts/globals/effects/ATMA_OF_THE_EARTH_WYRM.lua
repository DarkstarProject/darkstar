-----------------------------------
--
--  ATMA_OF_THE_EARTH_WYRM
--
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/common");
-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_EARTHRES,100);
		target:addMod(MOD_DMG,-20);
		target:addMod(MOD_FIRE_AFFINITY,1);
		target:addMod(MOD_EARTH_AFFINITY,1);
		target:addMod(MOD_WATER_AFFINITY,1);
		target:addMod(MOD_ICE_AFFINITY,1);
		target:addMod(MOD_THUNDER_AFFINITY,1);
		target:addMod(MOD_WIND_AFFINITY,1);
		target:addMod(MOD_LIGHT_AFFINITY,1);
		target:addMod(MOD_DARK_AFFINITY,1);
	end
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
	local weather = target:getWeather();
	if (effect:getPower() == 1) then
		if (weather == 0) then
			target:setMod(MOD_FIRE_AFFINITY,50);
			target:setMod(MOD_EARTH_AFFINITY,1);
			target:setMod(MOD_WATER_AFFINITY,1);
			target:setMod(MOD_ICE_AFFINITY,1);
			target:setMod(MOD_THUNDER_AFFINITY,1);
			target:setMod(MOD_WIND_AFFINITY,1);
			target:setMod(MOD_LIGHT_AFFINITY,1);
			target:setMod(MOD_DARK_AFFINITY,1);
		elseif (weather == 1) then
			target:setMod(MOD_FIRE_AFFINITY,1);
			target:setMod(MOD_EARTH_AFFINITY,50);
			target:setMod(MOD_WATER_AFFINITY,1);
			target:setMod(MOD_ICE_AFFINITY,1);
			target:setMod(MOD_THUNDER_AFFINITY,1);
			target:setMod(MOD_WIND_AFFINITY,1);
			target:setMod(MOD_LIGHT_AFFINITY,1);
			target:setMod(MOD_DARK_AFFINITY,1);
		elseif (weather == 2) then
			target:setMod(MOD_FIRE_AFFINITY,1);
			target:setMod(MOD_EARTH_AFFINITY,1);
			target:setMod(MOD_WATER_AFFINITY,50);
			target:setMod(MOD_ICE_AFFINITY,1);
			target:setMod(MOD_THUNDER_AFFINITY,1);
			target:setMod(MOD_WIND_AFFINITY,1);
			target:setMod(MOD_LIGHT_AFFINITY,1);
			target:setMod(MOD_DARK_AFFINITY,1);
		elseif (weather == 3) then
			target:setMod(MOD_FIRE_AFFINITY,1);
			target:setMod(MOD_EARTH_AFFINITY,1);
			target:setMod(MOD_WATER_AFFINITY,1);
			target:setMod(MOD_ICE_AFFINITY,50);
			target:setMod(MOD_THUNDER_AFFINITY,1);
			target:setMod(MOD_WIND_AFFINITY,1);
			target:setMod(MOD_LIGHT_AFFINITY,1);
			target:setMod(MOD_DARK_AFFINITY,1);
		elseif (weather == 4) then
			target:setMod(MOD_FIRE_AFFINITY,1);
			target:setMod(MOD_EARTH_AFFINITY,1);
			target:setMod(MOD_WATER_AFFINITY,1);
			target:setMod(MOD_ICE_AFFINITY,1);
			target:setMod(MOD_THUNDER_AFFINITY,50);
			target:setMod(MOD_WIND_AFFINITY,1);
			target:setMod(MOD_LIGHT_AFFINITY,1);
			target:setMod(MOD_DARK_AFFINITY,1);
		elseif (weather == 5) then
			target:setMod(MOD_FIRE_AFFINITY,1);
			target:setMod(MOD_EARTH_AFFINITY,1);
			target:setMod(MOD_WATER_AFFINITY,1);
			target:setMod(MOD_ICE_AFFINITY,1);
			target:setMod(MOD_THUNDER_AFFINITY,1);
			target:setMod(MOD_WIND_AFFINITY,50);
			target:setMod(MOD_LIGHT_AFFINITY,1);
			target:setMod(MOD_DARK_AFFINITY,1);
		elseif (weather == 6) then
			target:setMod(MOD_FIRE_AFFINITY,1);
			target:setMod(MOD_EARTH_AFFINITY,1);
			target:setMod(MOD_WATER_AFFINITY,1);
			target:setMod(MOD_ICE_AFFINITY,1);
			target:setMod(MOD_THUNDER_AFFINITY,1);
			target:setMod(MOD_WIND_AFFINITY,1);
			target:setMod(MOD_LIGHT_AFFINITY,50);
			target:setMod(MOD_DARK_AFFINITY,1);
		elseif (weather == 7) then
			target:setMod(MOD_FIRE_AFFINITY,1);
			target:setMod(MOD_EARTH_AFFINITY,1);
			target:setMod(MOD_WATER_AFFINITY,1);
			target:setMod(MOD_ICE_AFFINITY,1);
			target:setMod(MOD_THUNDER_AFFINITY,1);
			target:setMod(MOD_WIND_AFFINITY,1);
			target:setMod(MOD_LIGHT_AFFINITY,1);
			target:setMod(MOD_DARK_AFFINITY,50);
		end
	end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
	if (effect:getPower() == 1) then
		target:delMod(MOD_EARTHRES,100);
		target:delMod(MOD_DMG,-20);
		target:setMod(MOD_FIRE_AFFINITY,0);
		target:setMod(MOD_EARTH_AFFINITY,0);
		target:setMod(MOD_WATER_AFFINITY,0);
		target:setMod(MOD_ICE_AFFINITY,0);
		target:setMod(MOD_THUNDER_AFFINITY,0);
		target:setMod(MOD_WIND_AFFINITY,0);
		target:setMod(MOD_LIGHT_AFFINITY,0);
		target:setMod(MOD_DARK_AFFINITY,0);
	end
end;