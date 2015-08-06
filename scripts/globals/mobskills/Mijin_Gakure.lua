---------------------------------------------------
-- Ranged Attack
-- Deals a ranged attack to a single target.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    -- not always used
    if (skill:getParam() == 2 and math.random() <= 0.5) then
        return 1;
    end
    if (mob:getHPP() <= 60) then
        return 0;
    end
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1;

	local hpmod = mob:getHP() / mob:getMaxHP();
	
    local power = hpmod * 8 + 7;

    local baseDmg = mob:getWeaponDmg() * power;

    local info = MobMagicalMove(mob,target,skill,baseDmg,ELE_NONE,dmgmod,TP_MAB_BONUS,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_NONE,MOBPARAM_IGNORE_SHADOWS);

    if (mob:isInDynamis()) then
        -- dynamis mobs will kill themselves
        -- other mobs might not
        mob:setHP(0);
    end

    target:delHP(dmg);
    return dmg;
end;
