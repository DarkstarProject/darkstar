-----------------------------------
--
--  EFFECT_AVATAR
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
	local power = effect:getPower();
	local element = target:getPetElement();
	if element == nil or element == 0 then
		target:delStatusEffect(EFFECT_AVATAR);
	else
		local petName = target:getPetName();
		if target:getEquipID(SLOT_HANDS) == 14062 and petName == 'Carbuncle' then -- Carbuncle Mitts
			power = math.floor(power/2);
		elseif target:getEquipID(SLOT_HANDS) == 14946 and (target:hasStatusEffect(EFFECT_SLEEP_I) or target:hasStatusEffect(EFFECT_SLEEP_II)) then -- Nightmare Gloves
			power = power - 1;
		-- TODO: Add Evoker's Gages effect with Leviathan and during Beseiged.
		end
		
		if target:getEquipID(SLOT_HEAD) == 16154 and petName == 'Garuda' then -- Karura Hachigane
			power = power - 2;
		end
		
		if target:getEquipID(SLOT_BODY) == 14401 and petName == 'DarkSpirit' then -- Duende Cotehardie
			power = power - 1;
		elseif target:getEquipID(SLOT_BODY) == 14410 and petName == 'LightSpirit' then -- Nimbus Doublet
			power = power - 1;
		end
		
		if((target:getEquipID(SLOT_RING1) == 13300 or target:getEquipID(SLOT_RING2) == 13300) 
			and ((target:getHP() / target:getMaxHP() * 100) < 75) and target:getTP() < 100) then -- Conjurer's Ring
			power = power - 1;
		end
		
		-- TODO: Add Gamma Earring effect during Salvage.
		
		if target:getEquipID(SLOT_WAIST) == 15285 and target:getSubJob() == 15 then -- Avatar Belt
			power = power - 2;
		end
		
		local strong = {MOD_FIRE_AFFINITY, MOD_EARTH_AFFINITY, MOD_WATER_AFFINITY, MOD_WIND_AFFINITY, MOD_ICE_AFFINITY, MOD_THUNDER_AFFINITY, MOD_LIGHT_AFFINITY, MOD_DARK_AFFINITY}
		local weak = {MOD_WATER_AFFINITY, MOD_WIND_AFFINITY, MOD_THUNDER_AFFINITY, MOD_ICE_AFFINITY, MOD_FIRE_AFFINITY, MOD_EARTH_AFFINITY, MOD_DARK_AFFINITY, MOD_LIGHT_AFFINITY}
		
		local affinity = target:getMod(strong[element]) - target:getMod(weak[element]);
		if(target:getEquipID(SLOT_MAIN) == 18632) then
			affinity = affinity + 1;
		elseif(target:getEquipID(SLOT_MAIN) == 18633) then
			affinity = affinity + 2;
		end
		
		if affinity > 0 then
			power = power - affinity - 1;
		elseif affinity < 0 then
			power = power - affinity + 1;
		end

		power = power - target:getMod(MOD_AVATAR_PERPETUATION);
		local vanaDay = VanadielDayElement()+1;
		if(vanaDay == element) then
			power = power - target:getMod(MOD_DAY_PERPETUATION);
		-- Unsure if the opposite effect is supposed to occur
		--elseif(vanaDay == weak[element]) then
		--	power = power + target:getMod(MOD_DAY_PERPETUATION);
		end
		
		local currentWeather = target:getWeather();
		local weatherStrong = {4, 8, 6, 10, 12, 14, 16, 18};
		if(currentWeather == (weatherStrong[element] or weatherStrong[element]+1)) then
			power = power - target:getMod(MOD_WEATHER_PERPETUATION);
		-- Unsure if the opposite effect is supposed to occur
		--elseif(caster:getWeather() == (singleWeatherWeak[ele] or doubleWeatherWeak[ele]) then
		--	power = power + target:getMod(MOD_WEATHER_PERPETUATION);
		end
		
		if power < 1 then
			power = 1;
		end
		if target:hasStatusEffect(EFFECT_ASTRAL_FLOW) then
			power = 0;
		end
		target:delMP(power);
		if target:getMP() == 0 then
			target:despawnPet();
			target:delStatusEffect(EFFECT_AVATAR);
		end
	end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
end;