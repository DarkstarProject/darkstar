-----------------------------------
-- Area: Temple of Uggalepih
--  MOB: Rompaulion S Ciralle
-- Involved with San d'Oria quest "Knight Stalker"
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local Cleuvarion = GetMobAction(17428807);
    -- Get credit if other NM is dead/despawned or in the process of dieing/fading out
    if (player:getVar("KnightStalker_Progress") == 4 and (Cleuvarion == 0 or (Cleuvarion >= 20 and Cleuvarion <= 23))) then
        player:setVar("KnightStalker_Kill",1);
    end
end;