-----------------------------------
-- Area: Arrapago Reef
-- Door: Iron Gate (Lamian Fang Key)
-- !pos 580 -17 120
-----------------------------------
package.loaded["scripts/zones/Arrapago_Reef/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Arrapago_Reef/TextIDs")
require("scripts/globals/npc_util")
require("scripts/globals/status")
-----------------------------------

function onTrade(player,npc,trade)
    if npc:getAnimation() == dsp.anim.CLOSE_DOOR then
        if npcUtil.tradeHas(trade, 2219) then
            npc:openDoor(dsp.anim.ANIMATION_OPEN_DOOR)
            player:showText(npc,KEY_BREAKS,2219)
            player:confirmTrade()
        elseif npcUtil.tradeHas(trade, 1022) and player:getMainJob() == dsp.job.THF then -- thief's tools
            if math.random(1,2) == 1 then -- TODO: figure out actual percentage chance to pick locks; 50% for now
                player:showText(npc,LOCK_SUCCESS,1022)
                npc:openDoor(dsp.anim.ANIMATION_OPEN_DOOR)
            else
                player:showText(npc,LOCK_FAIL,1022)
            end
            player:confirmTrade()
        elseif npcUtil.tradeHas(trade, 1023) and player:getMainJob() == dsp.job.THF then -- living key
            if math.random(1,2) == 1 then -- TODO: figure out actual percentage chance to pick locks; 50% for now
                player:showText(npc,LOCK_SUCCESS,1023)
                npc:openDoor(dsp.anim.ANIMATION_OPEN_DOOR)
            else
                player:showText(npc,LOCK_FAIL,1023)
            end
            player:confirmTrade()
        elseif npcUtil.tradeHas(trade, 1115) and player:getMainJob() == dsp.job.THF then -- skeleton key
            if math.random(1,2) == 1 then -- TODO: figure out actual percentage chance to pick locks; 50% for now
                player:showText(npc,LOCK_SUCCESS,1115)
                npc:openDoor(dsp.anim.ANIMATION_OPEN_DOOR)
            else
                player:showText(npc,LOCK_FAIL,1115)
            end
            player:confirmTrade()
        end
    end
end

function onTrigger(player,npc)
    if player:getZPos() < 120 and npc:getAnimation() == dsp.anim.CLOSE_DOOR then
        if player:getMainJob() == dsp.job.THF then
            player:showText(npc,DOOR_IS_LOCKED2, 2219, 1022) -- message only THF's get
        else
            player:showText(npc,DOOR_IS_LOCKED, 2219)
        end
    elseif player:getZPos() >= 120 and npc:getAnimation() == dsp.anim.CLOSE_DOOR then
        player:messageSpecial(YOU_UNLOCK_DOOR) -- message from "inside" of door
        npc:openDoor(dsp.anim.ANIMATION_OPEN_DOOR)
    end
end

function onEventUpdate(player,csid,option,target)
end

function onEventFinish(player,csid,option,target)
end