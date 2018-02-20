-----------------------------------
-- Area: Castle Oztroja
--  MOB: Tzee Xicu the Manifest
-----------------------------------
package.loaded["scripts/zones/Castle_Oztroja/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Castle_Oztroja/TextIDs");
require("scripts/globals/titles");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
    -- Needs to be zone wide message
    -- mob:messagePublic(mob,YAGUDO_KING_ENGAGE);
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(DEITY_DEBUNKER);
    -- Needs to be zone wide message
    -- mob:messagePublic(mob,YAGUDO_KING_DEATH);
end;

function onMobDespawn(mob)

    -- Set Tzee_Xicu_the_Manifest's Window Open Time
    SetServerVariable("[POP]Tzee_Xicu_the_Manifest", os.time() + 72 * 3600); -- 3 days

    -- Set Yagudo_Avatar's spawnpoint and respawn time (21-24 hours)
    SetServerVariable("[PH]Tzee_Xicu_the_Manifest", 0);
    Yagudo_Avatar = 17396134;
    DisallowRespawn(Yagudo_Avatar, false);
    UpdateNMSpawnPoint(Yagudo_Avatar);
    GetMobByID(Yagudo_Avatar):setRespawnTime(math.random(75600,86400));

end;
