-----------------------------------
-- Area: Legion
-- Lofty_Ferromantoise 

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
    mob:setMod(MOD_REGAIN,25);
    mob:setMod(MOD_REGEN,35);	
    mob:addMod(MOD_MACC,425);
    mob:addMod(MOD_MDEF,55);
    mob:addMod(MOD_DEF,75);
    mob:addMod(MOD_ACC,125);	
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
    local Lofty_Ferromantoise_2hr = 0;
    if (mob:getLocalVar("Lofty_Ferromantoise_2hr") ~= nil) then
        Lofty_Ferromantoise_2hr = mob:getLocalVar("Lofty_Ferromantoise_2hr");
    end

    if (mob:getHPP() <= 15) then 
        if (Lofty_Ferromantoise_2hr == 1) then
            mob:useMobAbility(436); -- CS
            mob:setLocalVar("Lofty_Ferromantoise_2hr", 2);
        end
    elseif (mob:getHPP() <= 60) then 
        if (Lofty_Ferromantoise_2hr == 0) then
            mob:useMobAbility(435); -- MF
            mob:setLocalVar("Lofty_Ferromantoise_2hr", 1);
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
end;