-----------------------------------
-- Area: The Shrine of Ru'Avitau
-- NPC:  Kirin's Avatar: 17506675
-----------------------------------
package.loaded[ "scripts/zones/The_Shrine_of_RuAvitau/TextIDs" ] = nil;
-----------------------------------

require( "scripts/zones/The_Shrine_of_RuAvitau/TextIDs" );
require( "scripts/globals/status" );

-----------------------------------
-- onMobInitialize Action
-----------------------------------
function onMobInitialize( mob )
    
end

-----------------------------------
-- onMobSpawn Action
-----------------------------------
function onMobSpawn( mob )
    mob:setModelId(math.random(791, 798));
    mob:hideName(true);
    mob:untargetable(true);
    mob:setUnkillable(true);
end

-----------------------------------
-- onMobFight
-- Actions:
--  1 = Attacking
-- 34 = Preparing Astral Flow
-- 26 = Astral Flow used
-----------------------------------
function onMobFight( mob, target )
    local id = mob:getID();
    local kirin = GetMobByID(mob:getID()-5); -- Kirin's Avatar is offset by 5
    local action = GetMobAction(id);
    local distance = mob:checkDistance(target);
    
    local abilityId = nil;
    local modelId = mob:getModelId();
    
    switch (modelId) : caseof
    {
        [791] = function (x) abilityId = 663; end, -- Carbuncle
        [792] = function (x) abilityId = 583; end, -- Fenrir
        [793] = function (x) abilityId = 592; end, -- Ifrit
        [794] = function (x) abilityId = 601; end, -- Titan
        [795] = function (x) abilityId = 610; end, -- Leviathan
        [796] = function (x) abilityId = 619; end, -- Garuda
        [797] = function (x) abilityId = 628; end, -- Shiva
        [798] = function (x) abilityId = 637; end, -- Ramuh
    }
    
    if (action == 26) then -- ACTION_STUN
        mob:setUnkillable(false);
        mob:setHP(0);
    end
    if (action == 1 and distance <= 10) then -- ACTION_ATTACK
        if (abilityId ~= nil) then
            mob:useMobAbility(abilityId);
        end
    end
end

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath( mob, killer )
end

-----------------------------------
-- OnMobDespawn
-----------------------------------
function onMobDespawn( mob )
    -- Reset popped pet var..
    mob:resetLocalVars();
end
