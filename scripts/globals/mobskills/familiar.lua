---------------------------------------------
-- Familiar
-- pet powers increase.
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (mob:getMobMod(dsp.mobMod.SCRIPTED_2HOUR) == 1) then
        return 0;
    elseif (mob:getHPP() <= mob:getMobMod(dsp.mobMod.PROC_2HOUR) and mob:hasPet()) then
        return 0;
    end
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)

    mob:familiar();

    skill:setMsg(dsp.msg.basic.FAMILIAR);

    return 0;
end;
