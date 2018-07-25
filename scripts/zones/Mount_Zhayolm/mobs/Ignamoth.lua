-----------------------------------
-- Area: Mount Zhayolm
--  MOB: Ignamoth
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(dsp.mod.DOUBLE_ATTACK, 50)
    mob:addMod(dsp.mod.REGAIN, 50)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
end
function onMobFight(mob,target)
end

function onAdditionalEffect(mob, target, damage)
    local dmg = math.random(300,400)
    
    
    if ((math.random(1,100) >= 75) or (target:hasStatusEffect(dsp.effect.PARALYSIS) == true)) then
        return 0,0,0;
    else
        local duration = math.random(10,30);
        local message = dsp.msg.basic.ADD_EFFECT_DMG;
        target:addStatusEffect(dsp.effect.PARALYSIS,5,3,duration);
        
        return dsp.subEffect.ICE_DAMAGE,message,dmg;
    end
end

function onMobDeath(mob)
end