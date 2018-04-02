---------------------------------------------
-- Chains of Arrogance
--
---------------------------------------------
package.loaded["scripts/zones/Empyreal_Paradox/TextIDs"] = nil;
---------------------------------------------
require("scripts/zones/Empyreal_Paradox/TextIDs");
require("scripts/globals/monstertpmoves");
require("scripts/globals/keyitems");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    local targets = mob:getEnmityList();
    for i,v in pairs(targets) do
        if (v.entity:isPC()) then
            local race = v.entity:getRace()
            if (race == 3 or race == 4) and not v.entity:hasKeyItem(LIGHT_OF_MEA) then
                mob:showText(mob, PROMATHIA_TEXT + 1);
                return 0;
            end
        end
    end
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effects.TERROR;
    local power = 30;
    local duration = 30;

    if target:isPC() and ((target:getRace() == 3 or target:getRace() == 4) and not target:hasKeyItem(LIGHT_OF_MEA)) then
        skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, power, 0, duration));
    else
        skill:setMsg(msgBasic.SKILL_NO_EFFECT);
    end

    return typeEffect;
end;
