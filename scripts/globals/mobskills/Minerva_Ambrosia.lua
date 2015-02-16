---------------------------------------------
-- Minerva Custom Buff (Ambrosia)
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
     -- Extra stat buffs on top of usual Ambrosia food effect.
     mob:addMod(MOD_MATT, 40);
     mob:addMod(MOD_MACC, 80);
     mob:addMod(MOD_INT, 20);
     mob:addMod(MOD_MND, 24);
     mob:addMod(MOD_CHR, 10);
     -- End temp buffs
    skill:setMsg(0);
    mob:addStatusEffect(EFFECT_FOOD,0,0,14400,4511);
    return 0;
end;
