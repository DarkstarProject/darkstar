-----------------------------------
-- Area: Kuftal Tunnel
-- Mob: Robber Crab
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- OnMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- OnMobDeath Action
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkGoVregime(player,mob,735,1);
    checkGoVregime(player,mob,736,1);
    checkGoVregime(player,mob,738,1);
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    local mobID = mob:getID();
    if (mobID == 17490232) then -- Crab for Cancer spawn
        GetNPCByID(17490254):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
    end
end;