---------------------------------------------
-- Thornsong
--
-- Description: Covers the user in fiery spikes. Enemies that hit it take fire damage.
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self
-- Notes:
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    -- can only use if not silenced
    if (mob:getMainJob() == dsp.jobs.BRD and mob:hasStatusEffect(dsp.effects.SILENCE) == false) then
        return 0;
    end
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
    local power = mob:getMainLvl() * 2;
    local duration = 180;
    local typeEffect = dsp.effects.BLAZE_SPIKES;
    skill:setMsg(MobBuffMove(mob, typeEffect, power, 0, duration));
    return typeEffect;
end;
