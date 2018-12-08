---------------------------------------------
-- Chains of Apathy
--
---------------------------------------------
local ID = require("scripts/zones/Empyreal_Paradox/IDs")
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    local targets = mob:getEnmityList()
    for i,v in pairs(targets) do
        if (v.entity:isPC()) then
            local race = v.entity:getRace()
            if (race == dsp.race.HUME_M or race == dsp.race.HUME_F) and not v.entity:hasKeyItem(dsp.ki.LIGHT_OF_VAHZL) then
                mob:showText(mob, ID.text.PROMATHIA_TEXT)
                return 0
            end
        end
    end
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effect.TERROR
    local power = 30
    local duration = 30

    if target:isPC() and ((target:getRace() == dsp.race.HUME_M or target:getRace() == dsp.race.HUME_F) and not target:hasKeyItem(dsp.ki.LIGHT_OF_VAHZL)) then
        skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, power, 0, duration))
    else
        skill:setMsg(dsp.msg.basic.SKILL_NO_EFFECT)
    end
    return typeEffect
end
