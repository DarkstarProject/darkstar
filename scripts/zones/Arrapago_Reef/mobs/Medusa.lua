-----------------------------------
-- Area: Arrapago Reef
-- NPC:  Medusa
-- TODO: resists, attack/def boosts
-----------------------------------

require("scripts/globals/titles");
require("scripts/zones/Arrapago_Reef/MobIDs");
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
    target:showText(mob, MEDUSA_ENGAGE);
    SpawnMob(ExonOne,   180):updateEnmity(target);
    SpawnMob(ExonTwo,   180):updateEnmity(target);
    SpawnMob(ExonThree, 180):updateEnmity(target);
    SpawnMob(ExonFour,  180):updateEnmity(target);
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob, target)
    local HPP = mob:getHPP();
    if (mob:getLocalVar("usedees") == 0) then
        if (HPP <= mob:getLocalVar("eeshpp")) then
            mob:useMobAbility(479); -- Eagle Eye Shot
            mob:setLocalVar("usedees", 1);
        end
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
    killer:showText(mob, MEDUSA_DEATH);
	killer:addTitle(GORGONSTONE_SUNDERER);
end;