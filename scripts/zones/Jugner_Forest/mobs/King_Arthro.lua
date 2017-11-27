-----------------------------------
-- Area: Jugner Forest
--  MOB: King Arthro
-----------------------------------
require("scripts/globals/titles");
require("scripts/zones/Jugner_Forest/MobIDs");

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

    -- Lock all 10 Knight Crabs so they don't respawn while King Arthro is up
    GetMobByID(KNIGHT_CRAB1):setRespawnTime(0);
    GetMobByID(KNIGHT_CRAB2):setRespawnTime(0);
    GetMobByID(KNIGHT_CRAB3):setRespawnTime(0);
    GetMobByID(KNIGHT_CRAB4):setRespawnTime(0);
    GetMobByID(KNIGHT_CRAB5):setRespawnTime(0);
    GetMobByID(KNIGHT_CRAB6):setRespawnTime(0);
    GetMobByID(KNIGHT_CRAB7):setRespawnTime(0);
    GetMobByID(KNIGHT_CRAB8):setRespawnTime(0);
    GetMobByID(KNIGHT_CRAB9):setRespawnTime(0);
    GetMobByID(KNIGHT_CRAB10):setRespawnTime(0);    

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
   
    GetMobByID(KING_ARTHRO):setLocalVar("[POP]King_Arthro", 0);

    local RespawnTime = 30;--86700;
    -- Set temporary respawn of 24 hours + 5 minutes
    GetMobByID(KNIGHT_CRAB1):setRespawnTime(RespawnTime);
    GetMobByID(KNIGHT_CRAB2):setRespawnTime(RespawnTime);
    GetMobByID(KNIGHT_CRAB3):setRespawnTime(RespawnTime);
    GetMobByID(KNIGHT_CRAB4):setRespawnTime(RespawnTime);
    GetMobByID(KNIGHT_CRAB5):setRespawnTime(RespawnTime);
    GetMobByID(KNIGHT_CRAB6):setRespawnTime(RespawnTime);
    GetMobByID(KNIGHT_CRAB7):setRespawnTime(RespawnTime);
    GetMobByID(KNIGHT_CRAB8):setRespawnTime(RespawnTime);
    GetMobByID(KNIGHT_CRAB9):setRespawnTime(RespawnTime);
    GetMobByID(KNIGHT_CRAB10):setRespawnTime(RespawnTime);
   
end;
