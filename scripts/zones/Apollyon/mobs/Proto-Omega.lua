-----------------------------------
-- Area: Apollyon (Central)
--  Mob: Proto-Omega
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/mobs")
-----------------------------------
local ID = require("scripts/zones/Apollyon/IDs")

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
    mob:setMod(dsp.mod.COUNTER, 10) -- "Possesses a Counter trait"
    mob:setMod(dsp.mod.REGEN, 25) -- "Posseses an Auto-Regen (low to moderate)"
end

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.SUPERLINK, mob:getShortID())
    mob:setBehaviour(bit.bor(mob:getBehaviour(), dsp.behavior.NO_TURN))
    mob:setMod(dsp.mod.UDMGPHYS, -75)
    mob:setMod(dsp.mod.UDMGRANGE, -75)
    mob:setMod(dsp.mod.UDMGMAGIC, 0)
    mob:setMod(dsp.mod.MOVE, 100) -- "Moves at Flee Speed in Quadrupedal stance and in the Final Form"
end

function onMobFight(mob, target)
    local mobID = mob:getID()
    local formTime = mob:getLocalVar("formWait")
    local lifePercent = mob:getHPP()
    local currentForm = mob:getLocalVar("form")
    local podReady = mob:getBattlefield():getLocalVar("podReady")
    
    if lifePercent < 70 and currentForm < 1 then
        currentForm = 1
        mob:setLocalVar("form", currentForm)
        formTime = os.time()
        mob:setMod(dsp.mod.UDMGPHYS, 0)
        mob:setMod(dsp.mod.UDMGRANGE, 0)
        mob:setMod(dsp.mod.UDMGMAGIC, -75)
        mob:setMod(dsp.mod.MOVE, 0)
    end

    if currentForm == 1 then
        if formTime < os.time() then
            if mob:AnimationSub() == 1 then
                mob:AnimationSub(2)
                mob:setBehaviour(bit.band(mob:getBehaviour(), bit.bnot(dsp.behavior.NO_TURN)))
                if podReady == 1 and math.random(0,1) == 1 then
                    mob:useMobAbility(1532)
                end 
            else
                mob:setBehaviour(bit.bor(mob:getBehaviour(), dsp.behavior.NO_TURN))
                mob:AnimationSub(1)
            end
            mob:setLocalVar("formWait", os.time() + 60)
        end

        if lifePercent < 30 then
            mob:AnimationSub(2)
            mob:setBehaviour(bit.band(mob:getBehaviour(), bit.bnot(dsp.behavior.NO_TURN)))
            mob:setMod(dsp.mod.UDMGPHYS, -50)
            mob:setMod(dsp.mod.UDMGRANGE, -50)
            mob:setMod(dsp.mod.UDMGMAGIC, -50)
            mob:setMod(dsp.mod.MOVE, 100)
            mob:addStatusEffect(dsp.effect.REGAIN,7,3,0) -- The final form has Regain,
            mob:getStatusEffect(dsp.effect.REGAIN):setFlag(dsp.effectFlag.DEATH)
            currentForm = 2
            mob:setLocalVar("form", currentForm)
        end
    end
end

function onAdditionalEffect(mob, target, damage)
    return dsp.mob.onAddEffect(mob, target, damage, dsp.mob.ae.STUN)
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.APOLLYON_RAVAGER)
    GetNPCByID(ID.npc.APOLLYON_CENTRAL_CRATE):setStatus(dsp.status.NORMAL)
end

