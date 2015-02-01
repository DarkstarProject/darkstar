---------------------------------------------------
-- Mobskill: Call of the Moon
--
-- Howls at the moon to intimidate attackers.
-- Type: Enhancing
-- Can be dispelled: No
-- Utsusemi/Blink absorb: N/A
-- Range: Self - 10'
-- Note: All players and Campaign NPCs will be
-- intimidated for a short time. 
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_INTIMIDATE;

    MobStatusEffectMove(mob, target, typeEffect, 20, 0, 120);

    return typeEffect;
end;