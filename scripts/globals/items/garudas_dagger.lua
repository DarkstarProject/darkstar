-----------------------------------------
-- ID: 17627
-- Item: Garuda's Dagger
-- Additional Effect: Silence
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/weather");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 10;

    if (VanadielDayElement() == WINDSDAY) then
        chance = chance+6;
    end

    if (player:getWeather() == WEATHER_WIND) then
        chance = chance+4;
    elseif (player:getWeather() == WEATHER_GALES) then
        chance = chance+6;
    end

    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,ELE_WIND,0) <= 0.5) then
        return 0,0,0;
    else
        target:delStatusEffect(EFFECT_SILENCE);
        if (not target:hasStatusEffect(EFFECT_SILENCE)) then
            target:addStatusEffect(EFFECT_SILENCE, 1, 0, 60);
        end
        return SUBEFFECT_SILENCE, 160, EFFECT_SILENCE;
    end
end;