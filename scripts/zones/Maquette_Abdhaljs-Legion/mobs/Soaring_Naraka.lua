-----------------------------------
-- Area: Legion
-- Soaring_Naraka 

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
    mob:setMod(MOD_UFASTCAST, 35);
    mob:setMod(MOD_COUNTER, 20);	
    mob:addMod(MOD_MACC,425);	
    mob:addMod(MOD_MDEF,45);
    mob:addMod(MOD_DEF,75);	
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
    local Soaring_Naraka_2hr_Used = 0;
    if (mob:getLocalVar("Soaring_Naraka_2hr_Used") ~= nil) then
        Soaring_Naraka_2hr_Used = mob:getLocalVar("Soaring_Naraka_2hr_Used");
    end

    if (mob:getHPP() <= 10) then 
        if (Soaring_Naraka_2hr_Used == 2) then
            mob:useMobAbility(474); -- MK
            mob:setLocalVar("Soaring_Naraka_2hr_Used", 3);
        end
    elseif (mob:getHPP() <= 30) then 
        if (Soaring_Naraka_2hr_Used == 1) then
            mob:useMobAbility(435); -- MF
            mob:setLocalVar("Soaring_Naraka_2hr_Used", 2);
        end
    elseif (mob:getHPP() <= 70) then 
        if (Soaring_Naraka_2hr_Used == 0) then
            mob:useMobAbility(474); -- MK
            mob:setLocalVar("Soaring_Naraka_2hr_Used", 1);
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
    killer:addCurrency("legion_point", 100);
end;