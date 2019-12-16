-----------------------------------
-- Area: Quicksand Caves
--   NM: Triarius IV-XIV
-- Pops in Bastok mission 8-1 "The Chains that Bind Us"
-----------------------------------
local ID = require("scripts/zones/Quicksand_Caves/IDs")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobDisengage(mob)
    DespawnMob(mob:getID(), 120)
end

function onMobDeath(mob, player, isKiller)
    if isKiller and GetMobByID(ID.mob.CENTURIO_IV_VII):isDead() and GetMobByID(ID.mob.PRINCEPS_IV_XLV):isDead() then
        GetNPCByID(ID.npc.CHAINS_THAT_BIND_US_QM):setLocalVar("cooldown", os.time() + 300)
    end
end
