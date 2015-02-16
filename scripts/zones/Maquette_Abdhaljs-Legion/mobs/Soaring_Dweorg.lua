-----------------------------------
-- Area: Legion
-- Soaring_Dweorg 

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
    mob:setMod(MOD_REGEN, 25);
    mob:setMod(MOD_REFRESH, 25);
    mob:setMod(MOD_REGAIN, 45);
    mob:setMod(MOD_HASTE_ABILITY, 15);
    mob:setMod(MOD_UFASTCAST, 25);	
    mob:addMod(MOD_MACC,425);
    mob:addMod(MOD_MATT,25);
    mob:addMod(MOD_MDEF,75);
    mob:addMod(MOD_DEF,115);	
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
    local Soaring_Dweorg_2hr = 0;
    if (mob:getLocalVar("Soaring_Dweorg_2hr") ~= nil) then
        Soaring_Dweorg_2hr = mob:getLocalVar("Soaring_Dweorg_2hr");
    end

    if (mob:getHPP() <= 15) then 
        if (Soaring_Dweorg_2hr == 1) then
            mob:useMobAbility(435); -- MF
            mob:setLocalVar("Soaring_Dweorg_2hr", 2);
        end
    elseif (mob:getHPP() <= 60) then 
        if (Soaring_Dweorg_2hr == 0) then
            mob:useMobAbility(435); -- MF
            mob:setLocalVar("Soaring_Dweorg_2hr", 1);
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