---------------------------------------------
--  Fantod
--
--  Description: Enhances attack and magic attack
--  Type: Enhancing
--  
--  Range: Self
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_MAGIC_ATK_BOOST;
	local typeEffect = EFFECT_ATTACK_BOOST;
  

    skill:setMsg(MobBuffMove(mob, typeEffect, 30, 0, 120));

	return typeEffect;
end;