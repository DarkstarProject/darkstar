-----------------------------------
-- Area: Temple of Uggalepih
--  NPC: Granite Door
-- Notes: Door blocked by Temple Guardian
-- !pos -62 0 -99 159
-----------------------------------
local ID = require("scripts/zones/Temple_of_Uggalepih/IDs")
require("scripts/globals/status")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local guardian = GetMobByID(ID.mob.TEMPLE_GUARDIAN)

    if npc:getAnimation() == dsp.anim.CLOSE_DOOR then
        player:messageSpecial(ID.text.PROTECTED_BY_UNKNOWN_FORCE)
    end

    if guardian ~= nil and guardian:getHP() > 0 and guardian:getTarget() == nil then
        guardian:updateClaim(player)
    end

    return 1
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
