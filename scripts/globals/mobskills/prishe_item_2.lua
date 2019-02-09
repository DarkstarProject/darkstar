---------------------------------------------
-- Prishe Item 2
---------------------------------------------
local ID = require("scripts/zones/Empyreal_Paradox/IDs")
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (target:hasStatusEffect(dsp.effect.PHYSICAL_SHIELD) or target:hasStatusEffect(dsp.effect.MAGIC_SHIELD)) then
        return 1
    elseif (mob:hasStatusEffect(dsp.effect.PLAGUE) or mob:hasStatusEffect(dsp.effect.CURSE_I) or mob:hasStatusEffect(dsp.effect.MUTE)) then
        return 0
    elseif (math.random() < 0.25) then
        return 1
    end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    skill:setMsg(dsp.msg.basic.NONE)
    if (mob:hasStatusEffect(dsp.effect.PLAGUE) or mob:hasStatusEffect(dsp.effect.CURSE_I) or mob:hasStatusEffect(dsp.effect.MUTE)) then
        -- use Remedy!
        mob:messageText(mob, ID.text.PRISHE_TEXT + 12, false)
        mob:delStatusEffect(dsp.effect.PLAGUE)
        mob:delStatusEffect(dsp.effect.CURSE_I)
        mob:delStatusEffect(dsp.effect.MUTE)
    elseif (math.random() < 0.5) then
        -- Carnal Incense!
        mob:messageText(mob, ID.text.PRISHE_TEXT + 10, false)
        mob:addStatusEffect(dsp.effect.PHYSICAL_SHIELD, 0, 0, 30)
    else
        -- Spiritual Incense!
        mob:messageText(mob, ID.text.PRISHE_TEXT + 11, false)
        mob:addStatusEffect(dsp.effect.MAGIC_SHIELD, 0, 0, 30)
    end
    return 0
end
