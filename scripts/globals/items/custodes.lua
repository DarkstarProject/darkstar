-----------------------------------------
-- ID: 18762
-- Item: Custodes
-- Additional Effect: Paralysis
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 5;

    if (VanadielDayElement() == ICEDAY) then
        chance = chance+6;
    end

    if (player:getWeather() == WEATHER_ICE) then
        chance = chance+4;
    elseif (player:getWeather() == WEATHER_BLIZZARDS) then
        chance = chance+6;
    end

    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,ELE_ICE,0) <= 0.5) then
        return 0,0,0;
    else
        target:addStatusEffect(dsp.effects.PARALYSIS, 5, 0, 30);
        return SUBEFFECT_PARALYSIS, msgBasic.ADD_EFFECT_STATUS, dsp.effects.PARALYSIS;
    end
end;