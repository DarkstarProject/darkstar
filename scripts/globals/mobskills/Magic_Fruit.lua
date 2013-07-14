---------------------------------------------
--  Magic Fruit
--
--  Description: Restores HP for the target party member.
--  Type: Magical (Light)
--
--
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)

	local potency = skill:getParam() or 9;

	potency = potency + math.random(0, potency/2);

	skill:setMsg(MSG_SELF_HEAL);

	return MobHealMove(mob, mob:getHPP() * potency);
end;
