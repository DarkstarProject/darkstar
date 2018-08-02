-----------------------------------
-- Area: Apollyon CS
--  MOB: Carnagechief_Jackbodokk
-----------------------------------
package.loaded["scripts/zones/Apollyon/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Apollyon/TextIDs");
require("scripts/globals/limbus");
mixins = {require("scripts/mixins/job_special")};
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("superLink", os.time());
end;

function onMobEngaged(mob,target)
    SpawnMob(16933130, 300):updateEnmity(target);
    SpawnMob(16933131, 300):updateEnmity(target);
    SpawnMob(16933132, 300):updateEnmity(target);
end;

function onMobFight(mob,target)
    local instancetime = mob:getLocalVar("superLink");
    if ((GetMobByID(16933130):isDead() and GetMobByID(16933131):isDead() and GetMobByID(16933132):isDead() and 
        GetMobByID(16933133):isDead() and GetMobByID(16933134):isDead() and GetMobByID(16933135):isDead() and 
        GetMobByID(16933136):isDead()) and GetServerVariable("deadHelpers") == 3) then -- spawn helper mobs in waves when all are dead
        SpawnMob(16933134, 300):updateEnmity(target);
        SpawnMob(16933135, 300):updateEnmity(target);
        SpawnMob(16933133, 300):updateEnmity(target);
        SpawnMob(16933136, 300):updateEnmity(target);
    elseif ((GetMobByID(16933130):isDead() and GetMobByID(16933131):isDead() and GetMobByID(16933132):isDead() and 
        GetMobByID(16933133):isDead() and GetMobByID(16933134):isDead() and GetMobByID(16933135):isDead() and 
        GetMobByID(16933136):isDead()) and GetServerVariable("deadHelpers") == 7) then
        SpawnMob(16933130, 300):updateEnmity(target);
        SpawnMob(16933131, 300):updateEnmity(target);
        SpawnMob(16933132, 300):updateEnmity(target);
        SetServerVariable("deadHelpers",0); -- start counting again
    end

    if (os.time() - instancetime > 840) then -- after 14 minutes, link 3rd boss
        GetMobByID(16933137):updateEnmity(target);
    elseif (os.time() - instancetime > 420 and GetServerVariable("CSApoLink") ~= 4) then -- after 7 minutes, link 2nd boss (var makes sure 2nd boss doesn't link 3rd boss early)
        GetMobByID(16933144):updateEnmity(target);
        SetServerVariable("CSApoLink", 3); -- var says bosses 1 and 2 are linked
    end
end;

function onMobDeath(mob, player, isKiller)
    if ((IsMobDead(16933144) == false or IsMobDead(16933137) == false) 
    and alreadyReceived(player,1,GetInstanceRegion(1294)) == false) then
        player:addTimeToSpecialBattlefield(5,5);
        addLimbusList(player,1,GetInstanceRegion(1294));
    end
end;

function onMobDespawn (mob)
    if (GetMobByID(16933137):isDead() and GetMobByID(16933144):isDead()) then -- if this is last mob standing
        SetServerVariable("CSApoLink", 0); -- reset so bosses link next fight
        SetServerVariable("deadHelpers",0); -- reset so helpers spawn next fight
    end
end;
