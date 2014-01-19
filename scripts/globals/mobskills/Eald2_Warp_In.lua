---------------------------------------------------
-- Eald2 Warp In
-- Begin Eald'Narche ZM16 (phase 2) teleport
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 1;
end;

function OnMobWeaponSkill(target, mob, skill)
    mob:useMobAbility(733);
    skill:setMsg(0);
    return 0;
end;
