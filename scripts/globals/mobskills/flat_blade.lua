---------------------------------------------
-- Flat Blade
--
-- Description: Stuns enemy. Chance of stunning varies with TP.
-- Type: Physical
-- Utsusemi/Blink absorb: Shadow per hit
-- Range: Melee
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");

function onMobSkillCheck(target,mob,skill)
    if (mob:getPool() ~= 4006) then
        mob:messageBasic(msgBasic.READIES_WS, 0, 35);
    end
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    if (mob:getPool() == 4006) then -- Trion@Qubia_Arena only
        require("scripts/zones/Qubia_Arena/TextIDs");
        target:showText(mob,FLAT_LAND);
    end

    local numhits = 1;
    local accmod = 1;
    local dmgmod = 1.25;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_CRIT_VARIES,1.1,1.2,1.3);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);

    if (math.random(1,100) < skill:getTP()/3) then
        MobPhysicalStatusEffectMove(mob, target, skill, dsp.effects.STUN, 1, 0, 4);
    end

    -- AA EV: Approx 900 damage to 75 DRG/35 THF.  400 to a NIN/WAR in Arhat, but took shadows.
    target:delHP(dmg);
    return dmg;
end;
