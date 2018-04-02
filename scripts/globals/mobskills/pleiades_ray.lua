---------------------------------------------
--  Pleiades Ray
--
--  Description: Fires a magical ray at nearby targets. Additional effects: Paralysis + Blind + Poison + Plague + Bind + Silence + Slow
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: Unknown
--  Notes: Only used by Gurfurlur the Menacing with health below 20%.
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
  if(mob:getFamily() == 316) then
    local mobSkin = mob:getModelId();

    if (mobSkin == 1867) then
        return 0;
    else
        return 1;
    end
  end

    local result = 1;
    local mobhp = mob:getHPP();

    if (mobhp <= 20) then
        result = 0;
    end;

    return result;
end;

function onMobWeaponSkill(target, mob, skill)
    local duration = 120;

    MobStatusEffectMove(mob, target, dsp.effects.PARALYSIS, 40, 3, duration);
    MobStatusEffectMove(mob, target, dsp.effects.BLINDNESS, 40, 3, duration);
    MobStatusEffectMove(mob, target, dsp.effects.POISON, 10, 3, duration);
    MobStatusEffectMove(mob, target, dsp.effects.PLAGUE, 5, 3, duration);
    MobStatusEffectMove(mob, target, dsp.effects.BIND, 1, 0, duration);
    MobStatusEffectMove(mob, target, dsp.effects.SILENCE, 1, 0, duration);
    MobStatusEffectMove(mob, target, dsp.effects.SLOW, 128, 0, duration);

    local dmgmod = 1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*7,ELE_FIRE,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_FIRE,MOBPARAM_WIPE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
