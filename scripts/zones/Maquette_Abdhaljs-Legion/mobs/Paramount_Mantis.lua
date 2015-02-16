-----------------------------------
-- Area: Legion
-- Paramount_Mantis 

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
	
    mob:addMod(MOD_DOUBLE_ATTACK, 10);	
end

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    -- Mods
    mob:setMod(MOD_REGEN, 30);
    mob:setMod(MOD_REGAIN, 25);
    mob:setMod(MOD_HASTE_ABILITY, 15);
    mob:setMod(MOD_UFASTCAST, 15);
    mob:setMod(MOD_COUNTER, 20);	
    mob:addMod(MOD_MACC,425);		
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
    local Paramount_Mantis_2hr_Used = 0;
    if (mob:getLocalVar("Paramount_Mantis_2hr_Used") ~= nil) then
        Paramount_Mantis_2hr_Used = mob:getLocalVar("Paramount_Mantis_2hr_Used");
    end

    if (mob:getHPP() <= 3) then 
        if (Paramount_Mantis_2hr_Used == 2) then
            mob:useMobAbility(475); -- MG
            mob:setLocalVar("Paramount_Mantis_2hr_Used", 3);
        end
    elseif (mob:getHPP() <= 30) then 
        if (Paramount_Mantis_2hr_Used == 1) then
            mob:useMobAbility(434); -- HF
            mob:setLocalVar("Paramount_Mantis_2hr_Used", 2);
        end
    elseif (mob:getHPP() <= 70) then 
        if (Paramount_Mantis_2hr_Used == 0) then
            mob:useMobAbility(434); -- HS
            mob:setLocalVar("Paramount_Mantis_2hr_Used", 1);
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