-----------------------------------
-- Area: Jugner Forest
--  MOB: King Arthro
-----------------------------------
require("scripts/globals/titles");

-----------------------------------
-- onMonsterMagicPrepare
-----------------------------------

function onMonsterMagicPrepare(mob, target)

    -- Instant cast on spells - Waterga IV, Poisonga II, Drown, and Enwater
    local rnd = math.random();

    if (rnd < 0.2) then
        return 202; -- Waterga IV
    elseif (rnd < 0.6) then
        return 226; -- Poisonga II
    elseif (rnd < 0.8) then
        return 240; -- Drown
    else
        return 105; -- Enwater
    end

end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)

    local KingArthroID = mob:getID();

    -- Use King Arthro ID to determine Knight Crab Id's, then set their respawn to 0 so they don't spawn while KA is up
    for offset = 1, 10 do
        GetMobByID(KingArthroID - offset):setRespawnTime(0);
    end 

end

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
  
    local KingArthroID = mob:getID();
 
    GetMobByID(KingArthroID):setLocalVar("[POP]King_Arthro", 0);

    -- Set temporary respawn of 24 hours + 5 minutes
    for offset = 1, 10 do
        GetMobByID(KingArthroID - offset):setRespawnTime(86700);
    end
   
end;
