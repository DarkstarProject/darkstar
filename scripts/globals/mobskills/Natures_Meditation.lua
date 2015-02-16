---------------------------------------------------
-- Natures Meditation
-- 
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

   local typeEffect = EFFECT_ATTACK_BOOST;
   local base = mob:getMainLvl()*2 + 50;

    skill:setMsg(MobBuffMove(mob, typeEffect, base, 0, 180));

	return EFFECT_ATTACK_BOOST;

end