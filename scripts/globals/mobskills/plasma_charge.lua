---------------------------------------------
-- Plasma Charge
-- Covers the user in Shock spikes and absorbs damage. Enemies that hit it take fire damage.
--
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_SHOCK_SPIKES;
    local randy = math.random(15,30);
    skill:setMsg(MobBuffMove(mob, typeEffect, randy, 0, 180));

    return typeEffect;
end;