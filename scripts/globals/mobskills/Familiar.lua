---------------------------------------------------
-- Familiar
-- pet powers increase.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (mob:getMobMod(MOBMOD_SCRIPTED_2HOUR) == 1) then
        return 1;
    elseif (mob:getHPP() <= mob:getMobMod(MOBMOD_2HOUR_PROC) and mob:hasPet()) then
        return 0;
    end
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)

    mob:familiar();

    skill:setMsg(MSG_FAMILIAR);

    return 0;
end;
