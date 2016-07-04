
-- Area: Temple of Uggalepih
--  MOB: Cleuvarion M Resoaix
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
    local Rompaulion = GetMobAction(17428808);
    -- Get credit if other NM is dead/despawned or in the process of dieing/fading out
    if (player:getVar("KnightStalker_Progress") == 4 and (Rompaulion == 0 or (Rompaulion >= 20 and Rompaulion <= 23))) then
        player:setVar("KnightStalker_Kill",1);
    end
end;