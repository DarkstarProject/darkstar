---------------------------------------------------
-- Astral Flow (Kirin)
---------------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_ASTRAL_FLOW;
    skill:setMsg(MSG_USES);
	-- Spawn Avatar
    mob:spawnPet();
    return typeEffect;
end;
