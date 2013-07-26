---------------------------------------------------
--  Pollen
--
--  Description: Restores HP.
--
---------------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local potency = skill:getParam();

	if(potency == 0) then
		potency = 10;
	end

	potency = potency - math.random(0, potency/3);

	skill:setMsg(MSG_SELF_HEAL);

	return MobHealMove(mob, mob:getMaxHP() * potency / 100);
end;
