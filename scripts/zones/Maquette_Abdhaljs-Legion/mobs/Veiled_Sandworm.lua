-----------------------------------
-- Area: Legion
-- Veiled_Sandworm 

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
    mob:setMod(MOD_REGEN, 40);
    mob:setMod(MOD_REFRESH, 20);
    mob:setMod(MOD_REGAIN, 35);
    mob:setMod(MOD_HASTE_ABILITY, 10);
    mob:setMod(MOD_UFASTCAST, 55);	
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
    local Veiled_Sandworm_2hr = 0;
    if (mob:getLocalVar("Veiled_Sandworm_2hr") ~= nil) then
        Veiled_Sandworm_2hr = mob:getLocalVar("Veiled_Sandworm_2hr");
    end

    if (mob:getHPP() <= 10) then 
        if (Veiled_Sandworm_2hr == 0) then
            mob:useMobAbility(439); -- BW
            mob:setLocalVar("Veiled_Sandworm_2hr", 1);
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
    killer:addCurrency("legion_point", 15);
    SpawnMob(mob:getID()+3) -- Spawns Veiled_Gigaworm
end;