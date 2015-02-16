-----------------------------------
--
--  ATMA_OF_THE_BURNING_EFFIGY
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower() == 1) then
		target:addMod(MOD_STR,20);
		target:addMod(MOD_FIRE_AFFINITY,30);
		target:addMod(MOD_FIREATT,1);
		target:addMod(MOD_FIREACC,1);
	end
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
	local weather = target:getWeather();
	if (effect:getPower() == 1) then
		if (weather == 0) then
			target:setMod(MOD_FIREATT,50);
			target:setMod(MOD_FIREACC,50);
		else
			target:setMod(MOD_FIREATT,1);
			target:setMod(MOD_FIREACC,1);
		end
	end	
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
	if (effect:getPower() == 1) then
		target:delMod(MOD_STR,20);
		target:delMod(MOD_FIRE_AFFINITY,30);
		target:setMod(MOD_FIREATT,0);
		target:setMod(MOD_FIREACC,0);
	end
end;