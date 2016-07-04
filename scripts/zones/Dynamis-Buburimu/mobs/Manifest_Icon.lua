-----------------------------------
-- Area: Dynamis Buburimu
--  MOB: Manifest_Icon
-----------------------------------
package.loaded["scripts/zones/Dynamis-Buburimu/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Dynamis-Buburimu/TextIDs");
require("scripts/globals/dynamis");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
    dynamis.spawnGroup(mob, BuburimuYagudoList);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    local mobID = mob:getID();

    if ( mobID == 16941208 or mobID == 16941485) then -- hp
        player:messageBasic(024,(player:getMaxHP()-player:getHP()));
        player:restoreHP(3000);
     elseif (mobID == 16941190 or mobID == 16941192 or 16941486) then -- mp
        player:messageBasic(025,(player:getMaxMP()-player:getMP()));
        player:restoreMP(3000);
    end

end;