---------------------------------------------
--  Petal Pirouette
--
--  Description: Whirling petals reduce tp to zero.
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local tpReduced = 0;
    target:setTP(tpReduced);

    skill:setMsg(MSG_TP_REDUCED);

    return tpReduced;
end;
