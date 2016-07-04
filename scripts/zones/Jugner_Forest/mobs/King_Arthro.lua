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
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;