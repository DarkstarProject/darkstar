-----------------------------------
-- Area: East Ronfaure [S]
--  MOB: Battrap
-- Note:  Place Holder for Goblintrap NM
-- !pos 156 0 -438 81
-----------------------------------

require("scripts/zones/East_Ronfaure_[S]/MobIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    local GOBLIN_TRAP_PH = GOBLIN_TRAP - 1;

    if (mob:getID() == GOBLIN_TRAP_PH) then

        local ToD = GetServerVariable("[POP]Goblintrap");

        if (ToD <= os.time() and GetMobAction(GOBLIN_TRAP) == 0) then

            if (math.random(1,20) == 5) then

                GetMobByID(GOBLIN_TRAP):setRespawnTime(GetMobRespawnTime(GOLBIN_TRAP_PH));
                DisallowRespawn(GOBLIN_TRAP_PH, true);

            end

        end

    end
    
end;
