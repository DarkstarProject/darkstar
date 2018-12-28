-----------------------------------
-- Area: Western Altepa Desert
--   NM: King Vinegarroon
-----------------------------------
require("scripts/globals/weather")
require("scripts/globals/status")
require("scripts/globals/titles")
require("scripts/globals/msg")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
end

function onMobDrawIn(mob, target)
    -- todo make him use AoE tp move
    mob:addTP(3000)
end

function onMobDisengage(mob, weather)
    if weather ~= dsp.weather.DUST_STORM and weather ~= dsp.weather.SAND_STORM then
        DespawnMob(mob:getID())
    end
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.VINEGAR_EVAPORATOR)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(75600, 86400)) -- 21 to 24 hours
end

function onAdditionalEffect(mob, player)
    local resist = applyResistanceAddEffect(mob,player,dsp.magic.ele.EARTH,dsp.effect.PETRIFICATION)
    if (resist <= 0.5) then -- "Has an innate Additional Effect of Petrification on all of its physical attacks. "
        return 0,0,0
    else
        local duration = 30
        if mob:getMainLvl() > player:getMainLvl() then
            duration = duration + mob:getMainLvl() - player:getMainLvl()
        end
        duration = utils.clamp(duration,1,45)
        duration = duration * resist
        if not player:hasStatusEffect(dsp.effect.PETRIFICATION) then
            player:addStatusEffect(dsp.effect.PETRIFICATION, 1, 0, duration)
        end
        return dsp.subEffect.PETRIFY, dsp.msg.basic.ADD_EFFECT_STATUS, dsp.effect.PETRIFICATION
    end
end
