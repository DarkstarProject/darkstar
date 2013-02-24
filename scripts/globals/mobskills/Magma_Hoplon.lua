---------------------------------------------
-- Magma_Hoplon
-- Covers the user in fiery spikes and absorbs damage. Enemies that hit it take fire damage.
--
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	-- Disabled due to client crashes
	return 1;
end;

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_BLAZE_SPIKES;
    skill:setMsg(MobBuffMove(mob, typeEffect, randy, 0, 180));

	return typeEffect;
end;
