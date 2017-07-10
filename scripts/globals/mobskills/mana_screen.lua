---------------------------------------------
--  Mana_Screen
--
--  Description: Magic Shield

---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    local phase = mob:getLocalVar("battlePhase");
    if (phase >= 3) then
        return 0
    end;
    return 1;
end;    

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_MAGIC_SHIELD;

    skill:setMsg(MobBuffMove(mob, typeEffect, 1, 0, 60));
    return typeEffect;
end;
