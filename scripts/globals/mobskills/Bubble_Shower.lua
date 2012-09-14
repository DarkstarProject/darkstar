---------------------------------------------------
-- Bubble Shower
-- Deals Water damage in an area of effect. Additional effect: STR Down
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
        
        isEnfeeble = true;
        typeEffect = EFFECT_STR_DOWN;
        statmod = MOD_INT;
        resist = 1;--applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
        if(resist > 0.5) then
                if(target:getStatusEffect(EFFECT_STR_DOWN) == nil) then
                        target:addStatusEffect(EFFECT_STR_DOWN,30,0,180); -- -30
                end
        end
        
        dmgmod = 1;
        accmod = 1;
        cMobHp = mob:getHP();
        mMobHp = mob:getMaxHP();
        dmgmod = cMobHp/mMobHp * 2;
        info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,accmod,dmgmod,TP_NO_EFFECT);
        dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WATER,MOBPARAM_IGNORE_SHADOWS);
        target:delHP(dmg);
        return dmg;
        
end
