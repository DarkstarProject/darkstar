---------------------------------------------
--  Osmosis
--
--  Description: Steals an enemy's HP and one beneficial status effect. Ineffective against undead.
--  Type: Magical
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

    local effect = target:stealStatusEffect();

    if (effect ~= nil and mob:hasStatusEffect(effect:getType()) == false) then
        -- add to myself
        mob:addStatusEffect(effect:getType(), effect:getPower(), effect:getTickCount(), effect:getDuration());
    end

    local dmgmod = 1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*5,ELE_DARK,dmgmod,TP_MAB_BONUS,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_IGNORE_SHADOWS);

        skill:setMsg(MobPhysicalDrainMove(mob, target, skill, MOBDRAIN_HP, dmg));

    return dmg;
end;
