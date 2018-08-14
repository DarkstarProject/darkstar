---------------------------------------------
-- Sheep Bleat
-- Emits a unnerving bleat that slows down players in range.
--
-- Only used by Nightmare Sheep from Dynamis-Valkurm
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    -- The mob that uses this is not in database yet so returns 1
    -- when mob is added to game return zero and give that mob a skill list not shared with normal sheep..
    -- DO NOT check mobID.
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    skill:setMsg(MobStatusEffectMove(mob, target, dsp.effect.SLOW, 128, 0, 120))

    return typeEffect
end
