-----------------------------------
-- Area: Jugner Forest
--  MOB: King Arthro
-----------------------------------
mixins = {require("scripts/mixins/job_special")};
require("scripts/globals/status");
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_ADD_EFFECT, 1);
end;

function onMobSpawn(mob)
    local KingArthroID = mob:getID();

    -- Use King Arthro ID to determine Knight Crab Id's, then set their respawn to 0 so they don't spawn while KA is up
    for offset = 1, 10 do
        GetMobByID(KingArthroID - offset):setRespawnTime(0);
    end

    -- 20 minute rage timer
    mob:setMobMod(MOBMOD_RAGE, 1200);
end;

function onAdditionalEffect(mob,target,damage)
    local procRate = 10; -- No retail data, so we guessed at it.
    -- Can't proc it if enwater is up, if player full resists, or is just plain lucky.
    if (procRate > math.random(1,100) or mob:hasStatusEffect(EFFECT_ENWATER)
    or applyResistanceAddEffect(mob, target, ELE_ICE, 0) <= 0.5) then
        return 0,0,0;
    else
        target:addStatusEffect(EFFECT_PARALYSIS, 20, 0, 30); -- Potency unconfirmed
        return SUBEFFECT_PARALYSIS, msgBasic.ADD_EFFECT_STATUS, EFFECT_PARALYSIS;
    end
end;

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

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    local KingArthroID = mob:getID();

    GetMobByID(KingArthroID):setLocalVar("[POP]King_Arthro", 0);

    -- Set temporary respawn of 24 hours + 5 minutes
    for offset = 1, 10 do
        GetMobByID(KingArthroID - offset):setRespawnTime(86700);
    end
end;
