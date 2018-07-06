-----------------------------------
-- Area: Apollyon CS
--  MOB: Dee_Wapa_the_Desolator
-----------------------------------
package.loaded["scripts/zones/Apollyon/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/limbus");
require("scripts/zones/Apollyon/TextIDs");
require("scripts/globals/status");
mixins = {require("scripts/mixins/job_special")};

function onMobSpawn(mob)
    mob:setLocalVar("mainSpec", dsp.jsa.ASTRAL_FLOW_MAAT)
    mob:setLocalVar("superLink", os.time());
end;

function onMobEngaged(mob,target)
    SpawnMob(16933148, 300):updateEnmity(target);
    SpawnMob(16933147, 300):updateEnmity(target);
    SpawnMob(16933149, 300):updateEnmity(target);
    SpawnMob(16933146, 300):updateEnmity(target);
end;

function onMobFight(mob,target)
    local instancetime = mob:getLocalVar("superLink");
    if ((GetMobByID(16933146):isDead() and GetMobByID(16933147):isDead() and GetMobByID(16933148):isDead() and 
        GetMobByID(16933149):isDead() and GetMobByID(16933150):isDead() and GetMobByID(16933151):isDead() and 
        GetMobByID(16933152):isDead()) and GetServerVariable("deadYagHelpers") == 4) then -- spawn helper mobs in waves when all are dead
        SpawnMob(16933151, 300):updateEnmity(target);
        SpawnMob(16933150, 300):updateEnmity(target);
        SpawnMob(16933152, 300):updateEnmity(target);
    elseif ((GetMobByID(16933146):isDead() and GetMobByID(16933147):isDead() and GetMobByID(16933148):isDead() and 
        GetMobByID(16933149):isDead() and GetMobByID(16933150):isDead() and GetMobByID(16933151):isDead() and 
        GetMobByID(16933152):isDead()) and GetServerVariable("deadYagHelpers") == 7) then
        SpawnMob(16933148, 300):updateEnmity(target);
        SpawnMob(16933147, 300):updateEnmity(target);
        SpawnMob(16933149, 300):updateEnmity(target);
        SpawnMob(16933146, 300):updateEnmity(target);
        SetServerVariable("deadYagHelpers",0); -- start counting again
    end

    if (os.time() - instancetime > 840) then -- after 14 minutes, link 3rd boss
        GetMobByID(16933129):updateEnmity(target);
    elseif (os.time() - instancetime > 420 and GetServerVariable("CSApoLink") ~= 3) then -- after 7 minutes, link 2nd boss (var makes sure 2nd boss doesn't link 3rd boss early)
        GetMobByID(16933137):updateEnmity(target);
        SetServerVariable("CSApoLink", 5); -- var says bosses 2 and 3 are linked
    end
end;

function onMobDeath(mob, player, isKiller)
    if ((IsMobDead(16933129) == false or IsMobDead(16933137) == false)
    and alreadyReceived(player,3,GetInstanceRegion(1294)) == false) then          
        player:addTimeToSpecialBattlefield(5,5);
        addLimbusList(player,4,GetInstanceRegion(1294));
    end
end;

function onMobDespawn (mob)
    if (GetMobByID(16933129):isDead() and GetMobByID(16933137):isDead()) then -- if this is last mob standing
        SetServerVariable("CSApoLink", 0); -- reset so bosses link next fight
        SetServerVariable("deadYagHelpers",0); -- reset so helpers spawn next fight
    end
end;