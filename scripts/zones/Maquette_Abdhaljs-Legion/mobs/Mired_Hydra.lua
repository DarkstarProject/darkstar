-----------------------------------
-- Area: Legion
-- Mired_Hydra 

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
end

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    -- Mods
    mob:setMod(MOD_REGAIN,15);
    mob:setMod(MOD_REGEN,25);	
    mob:addMod(MOD_MACC,425);	
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
    local Mired_Hydra_2hr = 0;
    if (mob:getLocalVar("Mired_Hydra_2hr") ~= nil) then
        Mired_Hydra_2hr = mob:getLocalVar("Mired_Hydra_2hr");
    end

    if (mob:getHPP() <= 10) then 
        if (Mired_Hydra_2hr == 0) then
            mob:useMobAbility(432); -- MS
            mob:setLocalVar("Mired_Hydra_2hr", 1);
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
    killer:addCurrency("legion_point", 10);
    SpawnMob(mob:getID()+3) -- Spawns Mired_Alfard
end;