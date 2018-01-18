-----------------------------------
-- Area: Quicksand Caves
--  MOB: Princeps IV-XLV
-- Pops in Bastok mission 8-1 "The Chains that Bind Us"
-----------------------------------
require("scripts/zones/Quicksand_Caves/MobIDs");

function onMobDisengage(mob)
    DespawnMob(mob:getID(), 120);
end;

function onMobDeath(mob, player, isKiller)
    if (isKiller and GetMobByID(CENTURIO_IV_VII):isDead() and GetMobByID(TRIARIUS_IV_XIV):isDead()) then
        GetNPCByID(CHAINS_THAT_BIND_US_QM):setLocalVar("cooldown", os.time() + 300);
    end
end;
