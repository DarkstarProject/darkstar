-----------------------------------
-- Area: Legion
-- Veiled_Gigaworm 

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
	
    mob:addMod(MOD_DOUBLE_ATTACK, 15);	
end

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    -- Mods
    mob:setMod(MOD_REGEN, 50);
    mob:setMod(MOD_REFRESH, 30);
    mob:setMod(MOD_REGAIN, 35);
    mob:setMod(MOD_HASTE_ABILITY, 20);
    mob:setMod(MOD_UFASTCAST, 25);	
    mob:addMod(MOD_MACC,425);		
    mob:addMod(MOD_DEF,95);
    mob:addMod(MOD_MDEF,55);	
    mob:addMod(MOD_MATT,55);		
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
    local Veiled_Gigaworm_2hr = 0;
    if (mob:getLocalVar("Veiled_Gigaworm_2hr") ~= nil) then
        Veiled_Gigaworm_2hr = mob:getLocalVar("Veiled_Gigaworm_2hr");
    end

    if (mob:getHPP() <= 15) then 
        if (Veiled_Gigaworm_2hr == 1) then
            mob:useMobAbility(432); -- MS
            mob:setLocalVar("Veiled_Gigaworm_2hr", 2);
        end
    elseif (mob:getHPP() <= 60) then 
        if (Veiled_Gigaworm_2hr == 0) then
            mob:useMobAbility(435); -- MF
            mob:setLocalVar("Veiled_Gigaworm_2hr", 1);
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
    killer:addCurrency("legion_point", 30);
end;