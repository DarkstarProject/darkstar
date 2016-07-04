-----------------------------------
-- Ability: Elemental Siphon
-- Drains MP from your summoned spirit.
-- Obtained: Summoner level 50
-- Recast Time: 5:00
-- Duration: Instant
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/pets");
require("scripts/globals/magic")
require("scripts/globals/utils")
-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    local pet = player:getPetID();
    if (pet >= 0 and pet <= 7) then -- spirits
        return 0,0;
    else
        return MSGBASIC_UNABLE_TO_USE_JA,0;
    end
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    local spiritEle = player:getPetID() + 1; -- get the spirit's ID, then make it line up with element value for the day order.
    -- pet order: fire, ice, air, earth, thunder, water, light, dark
    -- day order: fire, earth, water, wind, ice, thunder, light, dark
    if (spiritEle == 2) then
        spiritEle = 5
    elseif (spiritEle == 3) then
        spiritEle = 4
    elseif (spiritEle == 4) then
        spiritEle = 2
    elseif (spiritEle == 5) then
        spiritEle = 6
    elseif (spiritEle == 6) then
        spiritEle = 3
    end;
    
    local pEquipMods = player:getMod(MOD_ENHANCES_ELEMENTAL_SIPHON);
    local basePower = player:getSkillLevel(SKILL_SUM) + pEquipMods - 50;
    if (basePower < 0) then -- skill your summoning magic you lazy bastard !
        basePower = 0;
    end;
    local weatherDayBonus = 1;
    local dayElement = VanadielDayElement();
    local weather = player:getWeather();

    -- Day bonus/penalty
    if (dayElement == dayStrong[spiritEle]) then
        weatherDayBonus = weatherDayBonus + 0.1;
    elseif (dayElement == dayWeak[spiritEle]) then
        weatherDayBonus = weatherDayBonus - 0.1;
    end
    -- Weather bonus/penalty
    if (weather == singleWeatherStrong[spiritEle]) then
        weatherDayBonus = weatherDayBonus + 0.1;
    elseif (weather == singleWeatherWeak[spiritEle]) then
        weatherDayBonus = weatherDayBonus - 0.1;
    elseif (weather == doubleWeatherStrong[spiritEle]) then
        weatherDayBonus = weatherDayBonus + 0.25;
    elseif (weather == doubleWeatherWeak[spiritEle]) then
        weatherDayBonus = weatherDayBonus - 0.25;
    end
    
    local power = math.floor(basePower * weatherDayBonus);
    local spirit = player:getPet();
    power = utils.clamp(power, 0, spirit:getMP()); -- cap MP drained at spirit's MP
    power = utils.clamp(power, 0, player:getMaxMP() - player:getMP()); -- cap MP drained at the max MP - current MP

    spirit:delMP(power);
    return player:addMP(power);
end;