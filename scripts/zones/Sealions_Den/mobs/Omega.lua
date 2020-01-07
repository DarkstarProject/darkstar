-----------------------------------
-- Area: Sealions Den
--  Mob: Omega
-----------------------------------
local ID = require("scripts/zones/Sealions_Den/IDs")
require("scripts/globals/titles")
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.EXP_BONUS, -100)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
    mob:setMobMod(dsp.mobMod.GIL_MAX, -1)
end

function onMobFight(mob, target)
    -- Gains regain at under 25% HP
    if mob:getHPP() < 25 and not mob:hasStatusEffect(dsp.effect.REGAIN) then
        mob:addStatusEffect(dsp.effect.REGAIN, 5, 3, 0)
        mob:getStatusEffect(dsp.effect.REGAIN):setFlag(dsp.effectFlag.DEATH)
    end
end

function onAdditionalEffect(mob, target, damage)
    return dsp.mob.onAddEffect(mob, target, damage, dsp.mob.ae.STUN)
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.OMEGA_OSTRACIZER)
    player:startEvent(11)
end

function onEventFinish(player, csid, option)
    if csid == 11 then
        local inst = player:getCharVar("bcnm_instanceid")

        if inst >= 1 and inst <= 3 then
            -- players are healed in between fights, but their TP is set to 0
            player:setHP(player:getMaxHP())
            player:setMP(player:getMaxMP())
            player:setTP(0)
            player:setLocalVar("[OTBF]cs", 2)

            -- move player to instance
            if inst == 1 then
                player:setPos(-779, -103, -80)
            elseif inst == 2 then
                player:setPos(-140, -23, -440)
            elseif inst == 3 then
                player:setPos(499, 56, -802)
            end
        end
    end
end
