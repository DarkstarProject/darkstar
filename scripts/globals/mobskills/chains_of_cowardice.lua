---------------------------------------------
-- Chains of Cowardice
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
            if (race == 5 or race == 6) and not v.entity:hasKeyItem(LIGHT_OF_HOLLA) then
                mob:showText(mob, PROMATHIA_TEXT + 2);
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

    if target:isPC() and ((target:getRace() == 5 or target:getRace() == 6) and not target:hasKeyItem(LIGHT_OF_HOLLA)) then
        skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, power, 0, duration));
    else
        skill:setMsg(msgBasic.SKILL_NO_EFFECT);
    end

    return typeEffect;
end;
