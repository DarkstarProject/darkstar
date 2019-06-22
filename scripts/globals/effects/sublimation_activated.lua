-----------------------------------
--
--
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
end

function onEffectTick(target,effect)
    local complete = false
    local level = 0
    if (target:getMainJob() == dsp.job.SCH) then
        level = target:getMainLvl()
    else
        level = target:getSubLvl()
    end
    local basemp = math.floor((level - 15)/10)
    local bonus = target:getMod(dsp.mod.SUBLIMATION_BONUS)

    local dmg = 2 + bonus

    local store = effect:getPower() + basemp + bonus

    local limit = math.floor((target:getBaseHP() + target:getMod(dsp.mod.HP) + target:getMerit(dsp.merit.MAX_HP)) / 4) +
        target:getMerit(dsp.merit.MAX_SUBLIMATION)

    if not (target:getHPP() < 51 ) then
        if (target:hasStatusEffect(dsp.effect.STONESKIN)) then
            local skin = target:getMod(dsp.mod.STONESKIN)
            if (skin >= dmg) then --absorb all damage
                target:delMod(dsp.mod.STONESKIN,dmg)
            else
                target:delStatusEffect(dsp.effect.STONESKIN)
                target:takeDamage(dmg - skin)
                if (target:getHPP() < 51 ) then
                    complete = true
                end
            end
        else
            target:takeDamage(dmg)
            if (target:getHPP() < 51 ) then
                complete = true
            end
        end
    else
        complete = true
    end

    if store > limit then
        store = limit
        complete = true
    end

    if (complete) then
        target:delStatusEffectSilent(dsp.effect.SUBLIMATION_ACTIVATED)
        target:addStatusEffect(dsp.effect.SUBLIMATION_COMPLETE,store,0,7200)
    else
        effect:setPower(store)
    end

end

function onEffectLose(target,effect)
end