-----------------------------------
-- Area: Quicksand Caves
--  MOB: Tribunus_IV-XIV
-- Pops in Bastok mission 8-1 "The Chains that Bind Us"
-----------------------------------
package.loaded["scripts/zones/Quicksand_Caves/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Quicksand_Caves/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------
function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDisengage Action
-----------------------------------
function onMobDisengage(mob)
    -- printf("Disengaging Triarius");
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

-----------------------------------
-- onMobDespawn Action
-----------------------------------
function onMobDespawn(mob)
    -- printf("Despawning Triarius");
    local mobsup = GetServerVariable("BastokFight8_1");
    SetServerVariable("BastokFight8_1",mobsup - 1);

    if (GetServerVariable("BastokFight8_1") == 0) then
        local npc = GetNPCByID(17629734); -- qm6
        npc:setStatus(0); -- Reappear
    end
end;