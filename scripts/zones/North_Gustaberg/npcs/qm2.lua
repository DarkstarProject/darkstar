-----------------------------------
-- Area: North Gustaberg
--  NPC: qm2 (???)
-- Involved in Quest "As Thick As Thieves"
-- !pos -232.924 99.107 442.990 106
-----------------------------------
local ID = require("scripts/zones/North_Gustaberg/IDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local thickAsThievesGamblingCS = player:getVar("thickAsThievesGamblingCS")

    if thickAsThievesGamblingCS == 5 and not GetMobByID(ID.mob.GAMBILOX_WANDERLING):isSpawned() then
        SpawnMob(ID.mob.GAMBILOX_WANDERLING):updateClaim(player)
    elseif thickAsThievesGamblingCS == 6 then
        player:startEvent(200,1092)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 200 and npcUtil.giveItem(player, 1092) then
        player:setVar("thickAsThievesGamblingCS",7)
    end
end
