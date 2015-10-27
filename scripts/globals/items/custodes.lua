-----------------------------------------
-- ID: 18762
-- Item: Custodes
-- Additional Effect: Paralysis
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
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
        target:addStatusEffect(EFFECT_PARALYSIS, 5, 0, 30);
        return SUBEFFECT_PARALYSIS, MSGBASIC_ADD_EFFECT_STATUS, EFFECT_PARALYSIS;
    end
end;