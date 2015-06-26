---------------------------------------------
--  Goblin Dice
--
--  Description: TP reset
--  Type: Physical (Blunt)
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
    local reset = 0;
    if(target:getTP() == 0) then
        skill:setMsg(MSG_NO_EFFECT); -- no effect
    else
        target:setTP(reset);
        skill:setMsg(MSG_TP_REDUCED);
    end
    return reset;
end;
