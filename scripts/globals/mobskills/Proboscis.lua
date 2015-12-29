---------------------------------------------------
-- Proboscis
-- Family: Wamoura
-- Description: Steals MP and dispels one beneficial status effect from targets in front.
-- Type: Magical
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Front cone
-- Notes: Damage shown in chat log is done to MP instead of HP.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

    local dmgmod = 1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*2.6,ELE_DARK,dmgmod,TP_MAB_BONUS,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_IGNORE_SHADOWS);
    dmg = utils.clamp(dmg, 0, target:getMP());

    skill:setMsg(MobPhysicalDrainMove(mob, target, skill, MOBDRAIN_MP, dmg));
    target:delHP(dmg);
    target:dispelStatusEffect();

    return dmg;
end;