---------------------------------------------------
-- Familiar
-- pet powers increase.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    if(mob:getHPP() <= 70 and mob:hasPet()) then
        return 0;
    end
    return 1;
end;

function OnMobWeaponSkill(target, mob, skill)

    mob:familiar();

    skill:setMsg(MSG_FAMILIAR);

    return 0;
end;
