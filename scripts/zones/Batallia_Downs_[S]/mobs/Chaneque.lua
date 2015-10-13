-----------------------------------
-- Area: Batallia Downs (S)
--  NM:  Chaneque
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_ADD_EFFECT,mob:getShortID());
end;

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------
function onAdditionalEffect(mob,target,damage)
    local chance = 10;
    
    if (math.random(0,99) >= chance) then
        return 0,0,0;
    else
        local power = 10;
        local params = {};
        params.bonusmab = 0;
        params.includemab = false;
        power = addBonusesAbility(mob, ELE_DARK, target, power, params);
        power = power * applyResistanceAddEffect(mob,target,ELE_DARK,0);
        power = adjustForTarget(target,power,ELE_DARK);
        power = finalMagicNonSpellAdjustments(mob,target,ELE_DARK,power);
        if (power < 0) then
            power = 0
        end
        return SUBEFFECT_HP_DRAIN, MSGBASIC_ADD_EFFECT_HP_DRAIN, mob:addHP(power);
    end
end;

-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
end;	