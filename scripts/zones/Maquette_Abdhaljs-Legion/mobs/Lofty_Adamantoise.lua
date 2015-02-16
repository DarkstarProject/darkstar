-----------------------------------
-- Area: Legion
-- Lofty Adamatoise 

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
    mob:setMobMod(MOBMOD_MAIN_2HOUR, 1); -- Invincible 
end

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setMod(MOD_REGAIN,15);
    mob:setMod(MOD_REGEN,25);
    mob:addMod(MOD_MACC,425);
    mob:addMod(MOD_MATT,50);
    mob:addMod(MOD_EVA,-115);	
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
    local Lofty_Adamantoise_2hr = 0;
    if (mob:getLocalVar("Lofty_Adamantoise_2hr") ~= nil) then
        Lofty_Adamantoise_2hr_Used = mob:getLocalVar("Lofty_Adamantoise_2hr");
    end

    if (mob:getHPP() <= 10) then 
        if (Lofty_Adamantoise_2hr_Used == 0) then
            mob:useMobAbility(438); -- Invicible
            mob:setLocalVar("Lofty_Adamantoise_2hr", 1);
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
    SpawnMob(mob:getID()+3) -- Spawns Lofty_Ferromantoise
end;