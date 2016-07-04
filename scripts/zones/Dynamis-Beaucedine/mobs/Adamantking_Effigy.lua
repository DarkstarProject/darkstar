-----------------------------------
-- Area: Dynamis Beaucedine
--  MOB: Adamantking Effigy
-- Map Position: http://images1.wikia.nocookie.net/__cb20090312005233/ffxi/images/thumb/b/b6/Bea.jpg/375px-Bea.jpg
-----------------------------------
package.loaded["scripts/zones/Dynamis-Beaucedine/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/dynamis");
require("scripts/zones/Dynamis-Beaucedine/TextIDs");

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
    dynamis.spawnGroup(mob, beaucedineQuadavList, 3);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local mobID = mob:getID();
    -- Time Bonus: 063 066
    if (mobID == 17326892 and mob:isInBattlefieldList() == false) then
        player:addTimeToDynamis(15);
        mob:addInBattlefieldList();
    elseif (mobID == 17326895 and mob:isInBattlefieldList() == false) then
        player:addTimeToDynamis(15);
        mob:addInBattlefieldList();
    -- HP Bonus: 056 059 065 070 074 103
    elseif (mobID == 17326885 or mobID == 17326888 or mobID == 17326894 or mobID == 17326899 or mobID == 17326903 or mobID == 17326932) then 
        player:restoreHP(2000);
        player:messageBasic(024,(player:getMaxHP()-player:getHP()));
    -- MP Bonus: 057 061 067 072 076
    elseif (mobID == 17326886 or mobID == 17326890 or mobID == 17326896 or mobID == 17326901 or mobID == 17326905) then 
        player:restoreMP(2000);
        player:messageBasic(025,(player:getMaxMP()-player:getMP()));
    end
    
end;
