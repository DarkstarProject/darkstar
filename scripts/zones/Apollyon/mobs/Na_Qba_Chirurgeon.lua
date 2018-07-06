-----------------------------------
-- Area: Apollyon CS
--  MOB: Na_Qba_Chirurgeon
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
    SpawnMob(16933139, 300):updateEnmity(target);
    SpawnMob(16933140, 300):updateEnmity(target);
    SpawnMob(16933138, 300):updateEnmity(target);
end;

function onMobFight(mob,target)
    local instancetime = mob:getLocalVar("superLink");
    if ((GetMobByID(16933138):isDead() and GetMobByID(16933139):isDead() and GetMobByID(16933140):isDead() and 
        GetMobByID(16933141):isDead() and GetMobByID(16933142):isDead() and GetMobByID(16933143):isDead()) and 
        GetServerVariable("deadQuadHelpers") == 3) then -- spawn helper mobs in waves when all are dead
        SpawnMob(16933142, 300):updateEnmity(target);
        SpawnMob(16933143, 300):updateEnmity(target);
        SpawnMob(16933141, 300):updateEnmity(target);
    elseif ((GetMobByID(16933138):isDead() and GetMobByID(16933139):isDead() and GetMobByID(16933140):isDead() and 
        GetMobByID(16933141):isDead() and GetMobByID(16933142):isDead() and GetMobByID(16933143):isDead()) and 
        GetServerVariable("deadQuadHelpers") == 6) then
        SpawnMob(16933139, 300):updateEnmity(target);
        SpawnMob(16933140, 300):updateEnmity(target);
        SpawnMob(16933138, 300):updateEnmity(target);
        SetServerVariable("deadQuadHelpers",0); -- start counting again
    end

    if (os.time() - instancetime > 840) then -- after 14 minutes, link 3rd boss 
        GetMobByID(16933144):updateEnmity(target);
    elseif (os.time() - instancetime > 420 and GetServerVariable("CSApoLink") ~= 5) then -- after 7 minutes, link 2nd boss (var makes sure 2nd boss doesn't link 3rd boss early)
        GetMobByID(16933129):updateEnmity(target);
        SetServerVariable("CSApoLink", 4); -- var says bosses 3 and 1 are linked
    end
end;

function onMobDeath(mob, player, isKiller)
    if ((IsMobDead(16933129) == false or IsMobDead(16933144) == false)
    and alreadyReceived(player,2,GetInstanceRegion(1294)) == false) then          
        player:addTimeToSpecialBattlefield(5,5);
        addLimbusList(player,2,GetInstanceRegion(1294));
    end
end;

function onMobDespawn (mob)
    if (GetMobByID(16933129):isDead() and GetMobByID(16933144):isDead()) then -- if this is last mob standing
        SetServerVariable("CSApoLink", 0); -- reset so bosses link next fight
        SetServerVariable("deadQuadHelpers",0); -- reset so helpers spawn next fight
    end
end;