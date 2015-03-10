-----------------------------------------
-- ID: 16684
-- Item: kabrakan's Axe
-- Additional Effect: slow
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------
function onAdditionalEffect(player,target,damage)
    local chance = 9;
    if (target:getMainLvl() > player:getMainLvl()) then
        chance = chance - 5 * (target:getMainLvl() - player:getMainLvl())
        chance = utils.clamp(chance, 5, 9);
    end
	if(player:getWeather() == WEATHER_DUST_STORM or WEATHER_SAND_STORM) then
		 chance = chance + 41;
	end
    if (math.random(0,99) >= chance) then
        return 0,0,0;
    else
        local duration = 25;
        if (target:getMainLvl() > player:getMainLvl()) then
            duration = duration - (target:getMainLvl() - player:getMainLvl())
        end
        utils.clamp(duration,1,25);
      --  duration = duration * applyResistanceAddEffect(player,target,EFFECT_SLOW,0);
        if (not target:hasStatusEffect(EFFECT_SLOW)) then
            target:addStatusEffect(EFFECT_SLOW, 1, 0, duration);
        end
        return SUBEFFECT_NONE, 160, EFFECT_SLOW;
    end
end;