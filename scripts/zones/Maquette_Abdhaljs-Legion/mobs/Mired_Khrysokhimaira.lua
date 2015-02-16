-----------------------------------
-- Area: Legion
-- Mired_Khrysokhimaira 

-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/utils");
require("scripts/globals/spoofchat");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    -- MobMods
    mob:setMobMod(MOBMOD_MAIN_2HOUR, 1); 
    mob:setMobMod(MOBMOD_SUB_2HOUR, 1); 
end

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    -- Mods
    mob:setMod(MOD_REGAIN,20);
    mob:setMod(MOD_REGEN,35);	
    mob:setMod(MOD_HASTE_ABILITY, 10);	
    mob:addMod(MOD_MACC,425);	
    mob:addMod(MOD_ACC,225);		
    mob:addMod(MOD_MDEF,65);	
    mob:addMod(MOD_DEF,95);			
end;

-----------------------------------

-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob, target)

end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob, target)
    local BattleStart = mob:getLocalVar("BattleStart");
    local Mired_Khrysokhimaira_2hr = 0;
    if (mob:getLocalVar("Mired_Khrysokhimaira_2hr") ~= nil) then
        Mired_Khrysokhimaira_2hr = mob:getLocalVar("Mired_Khrysokhimaira_2hr");
    end

    if (mob:getHPP() <= 15) then 
        if (Mired_Khrysokhimaira_2hr == 1) then
            mob:useMobAbility(438); -- Invinc
            mob:setLocalVar("Mired_Khrysokhimaira_2hr", 2);
        end
    elseif (mob:getHPP() <= 60) then 
        if (Mired_Khrysokhimaira_2hr == 0) then
            mob:useMobAbility(439); -- BW
            mob:setLocalVar("Mired_Khrysokhimaira_2hr", 1);
        end
    end
end;

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------
function onAdditionalEffect(mob,target,damage)
    
end;

-----------------------------------
-- onMagicHit
-----------------------------------

function onMagicHit(caster, target, spell)

end

-----------------------------------
-- onSpikesDamage
-----------------------------------

function onSpikesDamage(mob,target,damage)

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    killer:addCurrency("legion_point", 25);
    SpawnMob(mob:getID()+2) -- Spawns Mired_Mantis
end;