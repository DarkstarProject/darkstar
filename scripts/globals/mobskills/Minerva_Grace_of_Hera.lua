---------------------------------------------
--
-- Grace of Hera (Minerva's custom version)
--
-- Grants custom Light Spikes effect,
-- removes a harmful status effect
-- or Minerva heals for 9999 HP
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
    local erase = mob:eraseStatusEffect();
    mob:addStatusEffect(EFFECT_REPRISAL, 10, 0, 600);

    if (mob:eraseStatusEffect() == EFFECT_NONE) then
        skill:setMsg(MSG_SELF_HEAL);
        return MobHealMove(mob, 9999);
    else
        skill:setMsg(MSG_DISAPPEAR);
        return erase
    end
end;
