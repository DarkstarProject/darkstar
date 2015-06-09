---------------------------------------------
--  Chains of Apathy
--
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/globals/keyitems");
require("scripts/zones/Empyreal_Paradox/TextIDs");
---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    local targets = mob:getEnmityList();
    for i,v in pairs(targets) do
        if (v:isPC()) then
            local race = v:getRace()
            if (race == 8) and not v:hasKeyItem(LIGHT_OF_ALTAIEU) then
                mob:showText(mob, PROMATHIA_TEXT + 4);
                return 0;
            end
        end
    end
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)

	local typeEffect = EFFECT_TERROR;
	local power = 30;
	local duration = 30;

    if target:isPC() and ((target:getRace() == 8) and not target:hasKeyItem(LIGHT_OF_ALTAIEU)) then
        skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, power, 0, duration));
    else
        skill:setMsg(MSG_NO_EFFECT);
    end
	return typeEffect;
end;
