-----------------------------------
-- Ability: Elemental Siphon
-- Drains MP from your summoned
-- spirit.
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/magic");
require("scripts/globals/weather");

-----------------------------------
-- OnUseAbility
-----------------------------------

function onAbilityCheck(player,target,ability)
	if (player:getPet() == nil) then
		return MSGBASIC_REQUIRES_A_PET,0;
	else
		if (player:getMP() == player:getMaxMP()) then
			return MSGBASIC_UNABLE_TO_USE_JA,0;
		else
			return 0,0;
		end
	end
end;

function OnUseAbility(player, target, ability)

	-- PETID_FIRESPIRIT    = 0
	-- PETID_ICESPIRIT     = 1
	-- PETID_AIRSPIRIT     = 2
	-- PETID_EARTHSPIRIT   = 3
	-- PETID_THUNDERSPIRIT = 4
	-- PETID_WATERSPIRIT   = 5
	-- PETID_LIGHTSPIRIT   = 6
	-- PETID_DARKSPIRIT    = 7
	
	local recoverMP = 0;
	local bonus = 0;
	local feet = player:getEquipID(SLOT_FEET);
	local back = player:getEquipID(SLOT_BACK);
	local elementalSpirit = player:getPetID();
	local weather = player:getWeather();
	local petElement = player:getPetElement();
	local dayWeatherBonus = 1;
	local dayElement = VanadielDayElement();
	local strongDay = 0;
	local weakDay = 0;
	local strongSingleWeather = 0;
	local weakSingleWeather = 0;
	local strongDblWeather = 0;
	local weakDblWeather = 0;
	
	-- printf("Day %s",dayElement);
	-- printf("Weather %s",weather);
	
	if(feet == 11258) then
		bonus = 25;
	elseif(feet == 11158) then
		bonus = 50;
	end
	
	if(back == 28631) then
		bonus = 25;
	end

	-- printf("Equipment Bonus %u",bonus);
	-- printf("Pet ID %u",elementalSpirit);
	-- printf("Pet Element %u",petElement);
	
	if(elementalSpirit == 0) then
		strongDay = 0;
		weakDay = 2;
		strongSingleWeather = 4;
		weakSingleWeather = 6;
		strongDblWeather = 5;
		weakDblWeather = 7;
	elseif(elementalSpirit == 1) then
		strongDay = 4;
		weakDay = 0;
		strongSingleWeather = 12;
		weakSingleWeather = 4;
		strongDblWeather = 13;
		weakDblWeather = 5;
	elseif(elementalSpirit == 2) then
		strongDay = 3;
		weakDay = 4;
		strongSingleWeather = 10;
		weakSingleWeather = 12;
		strongDblWeather = 11;
		weakDblWeather = 13;
	elseif(elementalSpirit == 3) then
		strongDay = 1;
		weakDay = 3;
		strongSingleWeather = 8;
		weakSingleWeather = 10;
		strongDblWeather = 9;
		weakDblWeather = 11;
	elseif(elementalSpirit == 4) then
		strongDay = 5;
		weakDay = 1;
		strongSingleWeather = 14;
		weakSingleWeather = 8;
		strongDblWeather = 15;
		weakDblWeather = 9;
	elseif(elementalSpirit == 5) then
		strongDay = 2;
		weakDay = 5;
		strongSingleWeather = 6;
		weakSingleWeather = 14;
		strongDblWeather = 7;
		weakDblWeather = 15;
	elseif(elementalSpirit == 6) then
		strongDay = 6;
		weakDay = 7;
		strongSingleWeather = 16;
		weakSingleWeather = 18;
		strongDblWeather = 17;
		weakDblWeather = 19;
	elseif(elementalSpirit == 7) then
		strongDay = 7;
		weakDay = 6;
		strongSingleWeather = 18;
		weakSingleWeather = 16;
		strongDblWeather = 19;
		weakDblWeather = 17;
	end
	
	-- Bonuses for Weather
	if(strongSingleWeather == weather) then
		dayWeatherBonus = dayWeatherBonus + 0.10;
		-- printf("Add .10");
	elseif(weakSingleWeather == weatehr) then
		dayWeatherBonus = dayWeatherBonus - 0.10;
		-- printf("Minus .10");
	elseif(strongDblWeather == weather) then
		dayWeatherBonus = dayWeatherBonus + 0.25;
		-- printf("Add .25");
	elseif(weakDblWeather == weather) then
		dayWeatherBonus = dayWeatherBonus - 0.25;
		-- printf("Minus .25");
	end
	-- printf("Weather Bonus %g",dayWeatherBonus);
	
	-- Bonuses for Day
	if(dayElement == strongDay) then
		dayWeatherBonus = dayWeatherBonus + 0.10;
		-- printf("Add .10");
	elseif(dayElement == weakDay) then
		dayWeatherBonus = dayWeatherBonus - 0.10;
		-- printf("Minus .10");
	end
	-- printf("Day and Weather Bonus %g",dayWeatherBonus);

	recoverMP = (player:getSkillLevel(38) + bonus - 50) * dayWeatherBonus;
	-- printf("MP Recovered: %u",recoverMP);
	player:addMP(recoverMP);
	player:messageBasic(25,0,recoverMP);
end;
