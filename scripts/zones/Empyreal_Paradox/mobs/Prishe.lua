-----------------------------------
-- Area: Empyreal Paradox
--  Mob: Prishe
-- Chains of Promathia 8-4 BCNM Fight
-----------------------------------
local ID = require("scripts/zones/Empyreal_Paradox/IDs")
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:addMod(dsp.mod.REGAIN, 30)
end

function onMobRoam(mob)
    local promathia = ID.mob.PROMATHIA_OFFSET + (mob:getBattlefield():getArea() - 1) * 2
    local wait = mob:getLocalVar("wait")
    local ready = mob:getLocalVar("ready")

    if ready == 0 and wait > 240 then
        if GetMobByID(promathia):getCurrentAction() ~= dsp.act.NONE then
            mob:entityAnimationPacket("prov")
            mob:messageText(mob, ID.text.PRISHE_TEXT)
        else
            mob:entityAnimationPacket("prov")
            mob:messageText(mob, ID.text.PRISHE_TEXT + 1)
            promathia = promathia + 1
        end
        mob:setLocalVar("ready", promathia)
        mob:setLocalVar("wait", 0)
    elseif ready > 0 then
        mob:addEnmity(GetMobByID(ready), 0, 1)
    else
        mob:setLocalVar("wait", wait + 3)
    end
end

function onMobEngaged(mob, target)
    mob:useMobAbility(1487)
    mob:addStatusEffectEx(dsp.effect.SILENCE, 0, 0, 0, 5)
end

function onMobFight(mob, target)
    if mob:getLocalVar("Raise") == 1 then
        mob:messageText(mob, ID.text.PRISHE_TEXT + 3)
        mob:setLocalVar("Raise", 0)
        mob:stun(3000)
    elseif mob:getHPP() < 70 and mob:getLocalVar("HF") == 0 then
        mob:useMobAbility(dsp.jsa.HUNDRED_FISTS_PRISHE)
        mob:messageText(mob, ID.text.PRISHE_TEXT + 6)
        mob:setLocalVar("HF", 1)
    elseif mob:getHPP() < 30 and mob:getLocalVar("Bene") == 0 then
        mob:useMobAbility(dsp.jsa.BENEDICTION_PRISHE)
        mob:messageText(mob, ID.text.PRISHE_TEXT + 7)
        mob:setLocalVar("Bene", 1)
    end
    -- mob:setStatus(0)
end

function onMobDeath(mob, player, isKiller)
    mob:messageText(mob, ID.text.PRISHE_TEXT + 2)
end
