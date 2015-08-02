---------------------------------------------
--  Goblin Dice
--
--  Description: Benediction for party members within area of effect.
--  Type: Magical (Wind)
--
--
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

    local heal = target:getMaxHP() - target:getHP();

    skill:setMsg(MSG_SELF_HEAL);

    target:addHP(heal);
    target:wakeUp();

    return heal;
end;
