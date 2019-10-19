-----------------------------------
-- Area: Promyvion vahzl
--  NPC: Memory flux (3)
-----------------------------------
local ID = require("scripts/zones/Promyvion-Vahzl/IDs")
require("scripts/globals/missions")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if player:getCurrentMission(COP) == dsp.mission.id.cop.DESIRES_OF_EMPTINESS and player:getCharVar("PromathiaStatus") == 5 and not GetMobByID(ID.mob.PONDERER):isSpawned() then
        SpawnMob(ID.mob.PONDERER):updateClaim(player)
    elseif player:getCurrentMission(COP) == dsp.mission.id.cop.DESIRES_OF_EMPTINESS and player:getCharVar("PromathiaStatus") == 6 then
        player:startEvent(53)
    else
        player:messageSpecial(ID.text.OVERFLOWING_MEMORIES)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 53 then
        player:setCharVar("PromathiaStatus", 7)
    end
end
