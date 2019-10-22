-----------------------------------
-- Area: temenos
-- NPC:  Matter diffusion module
-- !pos
-----------------------------------
require("scripts/globals/bcnm")
local ID = require("scripts/zones/Temenos/IDs")

function onTrade(player, npc, trade)
    TradeBCNM(player, npc, trade)
end

function onTrigger(player, npc)
    EventTriggerBCNM(player, npc)
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
    EventFinishBCNM(player, csid, option)
end