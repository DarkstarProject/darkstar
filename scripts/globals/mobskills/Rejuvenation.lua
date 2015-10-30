---------------------------------------------
--  Wheel of Impregnability
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/zones/Empyreal_Paradox/TextIDs");
---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)

    local hp = target:getMaxHP() - target:getHP();
	target:addHP(hp);
    target:addMP(target:getMaxMP() - target:getMP());
    target:addTP(300 - target:getTP());
    
    skill:setMsg(MSG_SELF_HEAL);
    return hp;
end;
