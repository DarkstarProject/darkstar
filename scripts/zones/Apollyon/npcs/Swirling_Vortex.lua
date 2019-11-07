-----------------------------------
-- Area: Appolyon
-- NPC:  Radiant_Aureole
-- !pos
-----------------------------------
require("scripts/globals/bcnm")
local ID = require("scripts/zones/Apollyon/IDs")

function onTrade(player, npc, trade)
    if player:hasKeyItem(dsp.ki.COSMOCLEANSE) and
        ((player:hasKeyItem(dsp.ki.RED_CARD) and npc:getID() == ID.npc.SWIRLING_VORTEX)
        or (player:hasKeyItem(dsp.ki.BLACK_CARD) and npc:getID() == ID.npc.SWIRLING_VORTEX+1))
    then
        if npc:getID() == ID.npc.SWIRLING_VORTEX+1 then
            player:setCharVar("ApollyonEntrance", 1)
        else
            player:setCharVar("ApollyonEntrance", 0)
        end
        TradeBCNM(player, npc, trade)
    else
        player:messageSpecial(ID.text.NO_KEY+1)
    end
end

function onTrigger(player, npc)
    if player:hasKeyItem(dsp.ki.COSMOCLEANSE) and
        ((player:hasKeyItem(dsp.ki.RED_CARD) and npc:getID() == ID.npc.SWIRLING_VORTEX)
        or (player:hasKeyItem(dsp.ki.BLACK_CARD) and npc:getID() == ID.npc.SWIRLING_VORTEX+1))
    then
        if npc:getID() == ID.npc.SWIRLING_VORTEX+1 then
            player:setCharVar("ApollyonEntrance", 1)
        else
            player:setCharVar("ApollyonEntrance", 0)
        end
        EventTriggerBCNM(player, npc)
    else
        player:messageSpecial(ID.text.NO_KEY)
    end
end

function onEventUpdate(player, csid, option, extras)
    if EventUpdateBCNM(player, csid, option, extras) then
        for _, member in pairs(player:getAlliance()) do
            if member:getZoneID() == player:getZoneID() and not member:hasStatusEffect(dsp.effect.BATTLEFIELD) and not member:getBattlefield() then
                member:messageSpecial(ID.text.HUM)
            end
        end
    end
end

function onEventFinish(player, csid, option)
    if not EventFinishBCNM(player, csid, option) then
        player:setCharVar("ApollyonEntrance", 0)
    end
end