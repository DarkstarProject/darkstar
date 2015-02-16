---------------------------------------------------
--  Deathgnash
--
--  Description:  Reduces target's HP to 5% of its maximum value, ignores Utsusemi  ,Bind (30 sec)
--  Type: Magical
--  

---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)

end;

function onMobWeaponSkill(target, mob, skill)
 	local typeEffect = EFFECT_KO;

    skill:setMsg(MobGazeMove(mob, target, typeEffect, 1, 0, 1));
    return typeEffect;
end
