-----------------------------------
-- Area: Inner Horutoto Ruins
--  NPC: Sealed Portal
-- Involved in Quest: Making the Grade
-- Door should open when Whm+Blm+Rdm stand in correct regions (see \Inner_Horutoto_Ruins\zone.lua),
-- or if player has the KeyItem "portal charm".
-- !pos -259 -1 -20 192
-----------------------------------
local ID = require("scripts/zones/Inner_Horutoto_Ruins/IDs")
require("scripts/globals/keyitems")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if npc:getLocalVar("doorCoolDown") > os.time() then
        return
    elseif player:getZPos() >= -15 then
        player:messageSpecial(ID.text.PORTAL_NOT_OPEN_THAT_SIDE)
    else
        if player:hasKeyItem(dsp.ki.PORTAL_CHARM) then
            GetNPCByID(ID.npc.PORTAL_CIRCLE_BASE):openDoor(30)
            GetNPCByID(ID.npc.PORTAL_CIRCLE_BASE + 1):openDoor(30)
            GetNPCByID(ID.npc.PORTAL_CIRCLE_BASE + 2):openDoor(30)
            npc:timer(100, function(npc)
                GetNPCByID(ID.npc.PORTAL_CIRCLE_BASE + 3):entityAnimationPacket("slrg")
            end)
            npc:timer(500, function(npc)
                GetNPCByID(ID.npc.PORTAL_CIRCLE_BASE + 3):openDoor(30)
            end)
            npc:timer(2500, function(npc)
                npc:openDoor(30)
                GetNPCByID(ID.npc.PORTAL_CIRCLE_BASE + 3):entityAnimationPacket("klrg")
                npc:setLocalVar("doorCoolDown", os.time() + 38)
            end)
        else
            player:messageSpecial(ID.text.PORTAL_SEALED_BY_3_MAGIC)
        end
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end