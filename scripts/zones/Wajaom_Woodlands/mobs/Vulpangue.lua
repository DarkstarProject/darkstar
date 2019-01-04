-----------------------------------
-- Area: Wajaom Woodlands
-- ZNM: Vulpangue
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/weather")
-----------------------------------

function onMobSpawn(mob)
    mod:addMod((dsp.mod.FIRE_ABSORB + VanadielDayElement()),100)
    mob:addMod(dsp.mod.WIND_ABSORB, 100)
    mob:setLocalVar("HPP", 90)
end

function onMobFight(mob, target)
    local defUpHPP = mob:getLocalVar("HPP")
    if mob:getHPP() <= defUpHPP then
	    if mob:getHPP() > 10 then
        mob:addMod(dsp.mod.ACC, 10)
        mob:addMod(dsp.mod.ATT, 10)
        mob:setLocalVar("HPP", mob:getHPP() - 10)
		end
    end
end

function onMobDeath(mob, killer)
end