---------------------------------------------
-- Ark Guardian: Tarutaru
-- Begin Ark Angel TT teleport
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
    mob:useMobAbility(mob:getMobMod(MOBMOD_TELEPORT_END));
    skill:setMsg(0);
    return 0;
end;
