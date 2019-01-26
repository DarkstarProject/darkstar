---------------------------------------------
-- Reactor Cool
-- Gives Undispellable Ice Spikes and Defense Boost
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effect.ICE_SPIKES
    local typeEffect2 = dsp.effect.DEFENSE_BOOST
    local randy = math.random(15,30)

    -- Todo: check message behavior, this double setMsg() looks wrong
    skill:setMsg(MobBuffMove(mob, typeEffect, randy, 0, 60))
    local effect1 = mob:getStatusEffect(dsp.effect.ICE_SPIKES)
    effect1:unsetFlag(dsp.effectFlag.DISPELABLE)
    skill:setMsg(MobBuffMove(mob, typeEffect2, 26, 0, 60))
    local effect2 = mob:getStatusEffect(dsp.effect.DEFENSE_BOOST)
    effect2:unsetFlag(dsp.effectFlag.DISPELABLE)

    return typeEffect
end
