-----------------------------------
--
-- tpz.effect.HEALING
-- Activated through the /heal command
--
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/settings")
-----------------------------------

function onEffectGain(target,effect)
    target:setAnimation(33)
end

function onEffectTick(target,effect)

    local healtime = effect:getTickCount()

    if healtime > 2 then
        -- curse II also known as "zombie"
        if not(target:hasStatusEffect(tpz.effect.DISEASE)) and target:hasStatusEffect(tpz.effect.PLAGUE) == false and target:hasStatusEffect(tpz.effect.CURSE_II) == false then
            local healHP = 0
            if target:getContinentID() == 1 and target:hasStatusEffect(tpz.effect.SIGNET) then
                healHP = 10 + (3 * math.floor(target:getMainLvl() / 10)) + (healtime - 2) * (1 + math.floor(target:getMaxHP() / 300)) + target:getMod(tpz.mod.HPHEAL)
            else
                target:addTP(HEALING_TP_CHANGE)
                healHP = 10 + (healtime - 2) + target:getMod(tpz.mod.HPHEAL)
            end

            target:addHP(healHP)
            target:updateEnmityFromCure(target, healHP)
            target:addMP(12 + ((healtime - 2) * (1 + target:getMod(tpz.mod.CLEAR_MIND))) + target:getMod(tpz.mod.MPHEAL))
        end
    end
end

function onEffectLose(target,effect)
    target:setAnimation(0)
    target:delStatusEffect(tpz.effect.LEAVEGAME)
end
