-----------------------------------
-- Area: The Shrine of Ru'Avitau
--  MOB: Kirin's Avatar
-----------------------------------
package.loaded["scripts/zones/The_Shrine_of_RuAvitau/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/The_Shrine_of_RuAvitau/TextIDs");
require("scripts/globals/status");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setModelId(math.random(791, 798));
    mob:hideName(false);
    mob:untargetable(true);
    mob:setUnkillable(true);
end

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobEngaged(mob, target)
    local id = mob:getID();
    local kirin = GetMobByID(mob:getID()-5); -- Kirin's Avatar is offset by 5
    local action = GetMobAction(id);
    local distance = mob:checkDistance(target);
    local abilityId = nil;
    local modelId = mob:getModelId();

    switch (modelId) : caseof
    {
        [791] = function (x) abilityId = 912; end, -- Carbuncle
        [792] = function (x) abilityId = 839; end, -- Fenrir
        [793] = function (x) abilityId = 848; end, -- Ifrit
        [794] = function (x) abilityId = 857; end, -- Titan
        [795] = function (x) abilityId = 866; end, -- Leviathan
        [796] = function (x) abilityId = 875; end, -- Garuda
        [797] = function (x) abilityId = 884; end, -- Shiva
        [798] = function (x) abilityId = 893; end, -- Ramuh
    }

    if (abilityId ~= nil) then
        mob:useMobAbility(abilityId);
    end
end

-----------------------------------
-- onMobFight
-----------------------------------

function onMobFight(mob, target)
end

-----------------------------------
-- onMobWeaponSkill
-----------------------------------

function onMobWeaponSkill(target, mob, skill)
    mob:setUnkillable(false);
    mob:setHP(0);
end

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

-----------------------------------
-- OnMobDespawn
-----------------------------------

function onMobDespawn(mob)
end
