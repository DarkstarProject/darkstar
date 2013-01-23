---------------------------------------------------
-- Spirit Tap
-- Attempts to absorb one buff from a single target, or otherwise steals HP.
-- Type: Magical
-- Utsusemi/Blink absorb: Ignores Shadows
-- Range: Melee
-- Notes: Can be any (positive) buff, including food. Will drain about 100HP if it can't take any buffs
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)

    -- try to drain buff
    local effect = MobStealEffect(mob, target, 1);

    if(effect == EFFECT_NONE) then
        -- time to drain HP. 50-100
        local power = math.random(0, 50) + 50;
        local dmg = MobFinalAdjustments(power,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_IGNORE_SHADOWS);

        target:delHP(dmg);
        mob:addHP(dmg);
    else
        -- add buff to myself
        skill:setMsg(MSG_EFFECT_DRAINED);
        return effect;
    end

    return dmg;
end;
