-----------------------------------
-- Area: Xarcabard
-- NPC:  qm7 (???)
-- Involved in Quests: RNG AF3 quest - Unbridled Passion
-- !pos -295.065 -25.054 151.250 112
-----------------------------------
local ID = require("scripts/zones/Xarcabard/IDs")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if player:getCharVar("unbridledPassion") == 4 and not GetMobByID(ID.mob.KOENIGSTIGER):isSpawned() then
        player:startEvent(8)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 8 then
        SpawnMob(ID.mob.KOENIGSTIGER):updateClaim(player)
    end
end
