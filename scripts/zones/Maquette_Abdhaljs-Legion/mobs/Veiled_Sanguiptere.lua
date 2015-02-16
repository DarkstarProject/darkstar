-----------------------------------
-- Area: Legion
-- Veiled_Sanguiptere 

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
    mob:setMod(MOD_REGEN, 30);
    mob:setMod(MOD_REFRESH, 30);
    mob:setMod(MOD_REGAIN, 35);
    mob:setMod(MOD_HASTE_ABILITY, 15);
    mob:setMod(MOD_UFASTCAST, 55);
    mob:setMod(MOD_COUNTER, 15);	
    mob:addMod(MOD_MACC,425);	
    mob:addMod(MOD_DEF,125);	
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
    local Veiled_Sanguiptere_2hr = 0;
    if (mob:getLocalVar("Veiled_Sanguiptere_2hr") ~= nil) then
        Veiled_Sanguiptere_2hr = mob:getLocalVar("Veiled_Sanguiptere_2hr");
    end

    if (mob:getHPP() <= 15) then 
        if (Veiled_Sanguiptere_2hr == 1) then
            mob:useMobAbility(436); -- CS
            mob:setLocalVar("Veiled_Sanguiptere_2hr", 2);
        end
    elseif (mob:getHPP() <= 60) then 
        if (Veiled_Sanguiptere_2hr == 0) then
            mob:useMobAbility(434); -- HF
            mob:setLocalVar("Veiled_Sanguiptere_2hr", 1);
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
    SpawnMob(mob:getID()+3) -- Spawns Veiled_IronClad
end;