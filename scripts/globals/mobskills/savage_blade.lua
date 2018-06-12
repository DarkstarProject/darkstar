---------------------------------------------
-- Savage Blade
--
-- Description: Delivers a twofold attack. Damage varies with TP.
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
        mob:messageBasic(dsp.msg.basic.READIES_WS, 0, 42);
    end

    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    if (mob:getPool() == 4006) then -- Trion@QuBia_Arena only
        package.loaded["scripts/zones/QuBia_Arena/TextIDs"] = nil;
        require("scripts/zones/Qubia_Arena/TextIDs");
        target:showText(mob,SAVAGE_LAND);
    end

    local numhits = 2;
    local accmod = 1;
    local dmgmod = 2.0;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1.1,1.2,1.3);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);

    -- AA EV: Approx 900 damage to 75 DRG/35 THF.  400 to a NIN/WAR in Arhat, but took shadows.
    target:delHP(dmg);
    return dmg;
end;
