-----------------------------------------
-- ID: 18762
-- Item: Custodes
-- Additional Effect: Paralysis
-----------------------------------------
require("scripts/globals/weather")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 5

    if (VanadielDayElement() == dsp.day.ICEDAY) then
        chance = chance+6
    end

    if (player:getWeather() == WEATHER_ICE) then
        chance = chance+4
    elseif (player:getWeather() == dsp.weather.BLIZZARDS) then
        chance = chance+6
    end

    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,dsp.magic.ele.ICE,0) <= 0.5) then
        return 0,0,0
    else
        target:addStatusEffect(dsp.effect.PARALYSIS, 5, 0, 30)
        return dsp.subEffect.PARALYSIS, dsp.msg.basic.ADD_EFFECT_STATUS, dsp.effect.PARALYSIS
    end
end