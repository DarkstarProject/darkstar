---------------------------------------------
--  Howl
--
--  Description: Grants the effect of Warcry to user and any linked allies.
--  Type: Enhancing
--  Utsusemi/Blink absorb: N/A
--  Range: Self and nearby mobs of same family and/or force up to 20'.
-----------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local power = 25;
    local duration = 180;

    local typeEffect = EFFECT_WARCRY;
    skill:setMsg(MobBuffMove(mob, typeEffect, power, 0, duration));

    return typeEffect;
end;
