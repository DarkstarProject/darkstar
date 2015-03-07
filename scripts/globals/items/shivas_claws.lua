-----------------------------------------
-- ID: 17492
-- Item: Shiva's Claws
-- Additional Effect: Paralysis
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------
function onAdditionalEffect(player,target,damage)
    local chance = math.random(1,100)


    if (chance >= 9)then
        return 0,0,0;
	if(player:getWeather() == WEATHER_SNOW or WEATHER_BLIZZARDS) then
		chance = chance + 24;
		
    else
        target:delStatusEffect(EFFECT_PARALYSIS)
        if (not target:hasStatusEffect(EFFECT_PARALYSIS)) then
            target:addStatusEffect(EFFECT_PARALYSIS, 25, 0, 15);
        end
 return SUBEFFECT_PARALYSIS, 160, EFFECT_PARALYSIS;
    end
end;

