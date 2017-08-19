-----------------------------------
-- Area: Quicksand Caves
--  MOB: Princeps IV-XLV
-- Pops in Bastok mission 8-1 "The Chains that Bind Us"
-----------------------------------
package.loaded["scripts/zones/Quicksand_Caves/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Quicksand_Caves/TextIDs");
require("scripts/globals/status");
-----------------------------------
-- onMobSpawn Action
-----------------------------------
function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDisengage Action
-----------------------------------
function onMobDisengage(mob)
    local self = mob:getID();
    DespawnMob(self, 120);
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------
function onMobDeath(mob, player, isKiller)
    if (player:getCurrentMission(BASTOK) == THE_CHAINS_THAT_BIND_US and player:getVar("MissionStatus") == 1) then
        SetServerVariable("Bastok8-1LastClear", os.time());
    end
end;
-- and GetMobById(17629187):isDead() and GetMobById(17629188):isDead()
-----------------------------------
-- onMobDespawn Action
-----------------------------------
function onMobDespawn(mob)
    local ants = GetServerVariable("BastokFight8_1");
    SetServerVariable("BastokFight8_1", ants + 1);

    if (GetServerVariable("BastokFight8_1") >= 3) then
        local npc = GetNPCByID(17629738); -- qm6
        npc:setStatus(STATUS_NORMAL); -- Reappear
    end
end;