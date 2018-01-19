-----------------------------------
-- Area: Temple of Uggalepih
--  MOB: Rompaulion S Ciralle
-- Involved with San d'Oria quest "Knight Stalker"
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    -- Get credit if other NM is dead/despawned or in the process of dieing/fading out
    local Cleuvarion = GetMobByID(mob:getID() - 1);
    if (player:getVar("KnightStalker_Progress") == 4 and Cleuvarion:isDead()) then
        player:setVar("KnightStalker_Kill",1);
    end
end;
