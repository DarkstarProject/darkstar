---------------------------------------------
-- Red lotus Blade
--
-- Description: Deals fire elemental damage. Damage varies with TP.
-- Type: Physical
-- Utsusemi/Blink absorb: 1 Shadow?
-- Range: Melee
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
-- Can't load 2 zones TextIDs at once, don't move them here!
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (mob:getPool() ~= 4006 and mob:getPool() ~= 4249) then
        mob:messageBasic(43, 0, 34);
    end
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    if (mob:getPool() == 4006) then -- Trion@QuBia_Arena only
        package.loaded["scripts/zones/QuBia_Arena/TextIDs"] = nil;
        require("scripts/zones/Qubia_Arena/TextIDs");
        target:showText(mob,RLB_LAND);
    elseif (mob:getPool() == 4249) then -- Volker@Throne_Room only
        package.loaded["scripts/zones/Throne_Room/TextIDs"] = nil;
        require("scripts/zones/Throne_Room/TextIDs");
        target:showText(mob,FEEL_MY_PAIN);
    end

    local dmgmod = 1.25;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*4,ELE_FIRE,dmgmod,TP_DMG_BONUS,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_FIRE,MOBPARAM_1_SHADOW);

    skill:setSkillchain(34);

    target:delHP(dmg);
    return dmg;
end;
