---------------------------------------------
--  Shadow Spread
--
--  Description: A dark shroud renders any nearby targets blinded, asleep, and cursed.
--
--
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    if(mob:isMobType(MOBTYPE_NOTORIOUS)) then
        return 0;
    end
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)

    skill:setMsg(MobStatusEffectMove(mob, target, EFFECT_CURSE_I, 25, 0, 300));
    MobStatusEffectMove(mob, target, EFFECT_SLEEP_I, 1, 0, 30);
    MobStatusEffectMove(mob, target, EFFECT_BLINDNESS, 20, 0, 180);

    return EFFECT_CURSE_I;
end;
