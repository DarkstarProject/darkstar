---------------------------------------------------
-- Carousel
-- Becomes a merry-go-round of pain that damages players in range.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    if(mob:isMobType(MOBTYPE_NOTORIOUS)) then
        return 0;
    end
    return 1;
end;

function OnMobWeaponSkill(target, mob, skill)
    local numhits = math.random(2,3);
    local accmod = 1;
    local dmgmod = 1.3;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);
    target:delHP(dmg);
    return dmg;
end;
