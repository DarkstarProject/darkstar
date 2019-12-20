-----------------------------------
-- Area: Temenos
--  Mob: Proto-Ultima
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")

function onMobSpawn(mob)
    mob:SetMagicCastingEnabled(false)
end

function onMobEngaged(mob, target)
    dsp.limbus.hideArmouryCrates(mob:getBattlefieldID())
end

function onMobFight(mob, target)
    local phase = mob:getLocalVar("battlePhase")
    if mob:actionQueueEmpty() then
        if mob:getHPP() < (80 - (phase * 20)) then
            mob:useMobAbility(1524) -- use Dissipation on phase change
            phase = phase + 1
            if phase == 2 then -- enable Holy II
                mob:SetMagicCastingEnabled(true)
            end
            if phase == 4 then -- add Regain in final phase
                if not mob:hasStatusEffect(dsp.effect.REGAIN) then
                    mob:addStatusEffect(dsp.effect.REGAIN, 7, 3, 0)
                    mob:getStatusEffect(dsp.effect.REGAIN):setFlag(dsp.effectFlag.DEATH)
                end
            end
            mob:setLocalVar("battlePhase", phase) -- incrementing the phase here instead of in the Dissipation skill because stunning it prevents use.
        end
    end
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.TEMENOS_LIBERATOR)
    if isKiller then
        GetNPCByID(ID.npc.TEMENOS_C_CRATE[4][1]):setStatus(dsp.status.NORMAL)
    end
end
