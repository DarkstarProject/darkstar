-----------------------------------
-- Area: Arrapago Reef
--  MOB: Medusa
-- @pos -458 -20 458
-- TODO: resists, attack/def boosts
-----------------------------------

require("scripts/globals/titles");
require("scripts/zones/Arrapago_Reef/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("eeshpp", math.random(5,99)); -- Uses EES randomly during the fight
end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob, target)
    local mobID = mob:getID();
    target:showText(mob, MEDUSA_ENGAGE);
    SpawnMob(mobID+1, 180):updateEnmity(target);
    SpawnMob(mobID+2, 180):updateEnmity(target);
    SpawnMob(mobID+3, 180):updateEnmity(target);
    SpawnMob(mobID+4, 180):updateEnmity(target);
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob, target)
    local HPP = mob:getHPP();
    if (mob:getLocalVar("usedees") == 0) then
        if (HPP <= mob:getLocalVar("eeshpp")) then
            mob:useMobAbility(1931); -- Eagle Eye Shot
            mob:setLocalVar("usedees", 1);
        end
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:showText(mob, MEDUSA_DEATH);
    player:addTitle(GORGONSTONE_SUNDERER);
end;
