-----------------------------------
-- Area: Promyvion vahzl
--  NPC: Memory flux (1)
-----------------------------------
local ID = require("scripts/zones/Promyvion-Vahzl/IDs")
require("scripts/globals/missions")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if player:getCurrentMission(COP) == DESIRES_OF_EMPTINESS and player:getVar("PromathiaStatus") == 1 and not GetMobByID(ID.mob.PROPAGATOR):isSpawned() then
        SpawnMob(ID.mob.PROPAGATOR):updateClaim(player)
    elseif player:getCurrentMission(COP) == DESIRES_OF_EMPTINESS and player:getVar("PromathiaStatus") == 2 then
        player:startEvent(51)
    else
        player:messageSpecial(ID.text.OVERFLOWING_MEMORIES)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 51 then
        player:setVar("PromathiaStatus", 3)
    end
end
