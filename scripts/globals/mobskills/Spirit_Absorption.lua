---------------------------------------------------
-- Spirit Absorption
-- Attempts to absorb one buff from a single target, or otherwise steals HP.
-- Type: Magical
-- Utsusemi/Blink absorb: 1 Shadows
-- Range: Melee
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (mob:isMobType(MOBTYPE_NOTORIOUS)) then
        return 1;
    end
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

    -- time to drain HP. 50-100
    local power = math.random(0, 51) + 50;
    local dmg = MobFinalAdjustments(power,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_1_SHADOW);

    skill:setMsg(MSG_DRAIN_HP);

    if (MobPhysicalHit(skill, 0, 0, 0)) then
        target:delHP(dmg);
        mob:addHP(dmg);
    end

    return dmg;
end;
