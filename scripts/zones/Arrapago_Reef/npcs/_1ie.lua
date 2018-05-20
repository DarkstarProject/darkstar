-----------------------------------
-- Area: Arrapago Reef
-- Door: Iron Gate (Lamian Fang Key)
-- !pos 580 -17 120
-----------------------------------
package.loaded["scripts/zones/Arrapago_Reef/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Arrapago_Reef/TextIDs")
require("scripts/globals/status")

function onTrade(player,npc,trade)
    if npc:getAnimation() == ANIMATION_CLOSE_DOOR then
        if trade:hasItemQty(2219,1) and trade:getItemCount() == 1 then
            npc:openDoor(ANIMATION_OPEN_DOOR)
            player:showText(npc,KEY_BREAKS,2219)
            player:tradeComplete()
        elseif trade:hasItemQty(1022,1) and trade:getItemCount() == 1 and player:getMainJob() == dsp.job.THF then -- thief's tools
            if math.random(1,2) == 1 then -- TODO: figure out actual percentage chance to pick locks; 50% for now
                player:showText(npc,LOCK_SUCCESS,1022)
                npc:openDoor(ANIMATION_OPEN_DOOR)
            else
                player:showText(npc,LOCK_FAIL,1022)
            end
            player:tradeComplete()
        elseif trade:hasItemQty(1023,1) and trade:getItemCount() == 1 and player:getMainJob() == dsp.job.THF then -- living key
            if math.random(1,2) == 1 then -- TODO: figure out actual percentage chance to pick locks; 50% for now
                player:showText(npc,LOCK_SUCCESS,1023)
                npc:openDoor(ANIMATION_OPEN_DOOR)
            else
                player:showText(npc,LOCK_FAIL,1023)
            end
            player:tradeComplete()
        elseif trade:hasItemQty(1115,1) and trade:getItemCount() == 1 and player:getMainJob() == dsp.job.THF then -- skeleton key
            if math.random(1,2) == 1 then -- TODO: figure out actual percentage chance to pick locks; 50% for now
                player:showText(npc,LOCK_SUCCESS,1115)
                npc:openDoor(ANIMATION_OPEN_DOOR)
            else
                player:showText(npc,LOCK_FAIL,1115)
            end
            player:tradeComplete()
        end
    end
end

function onTrigger(player,npc)
    if player:getZPos() < 120 and npc:getAnimation() == ANIMATION_CLOSE_DOOR then
        if player:getMainJob() == dsp.job.THF then
            player:showText(npc,DOOR_IS_LOCKED2, 2219, 1022) -- message only THF's get
        else
            player:showText(npc,DOOR_IS_LOCKED, 2219)
        end
    elseif player:getZPos() >= 120 and npc:getAnimation() == ANIMATION_CLOSE_DOOR then
        player:messageSpecial(YOU_UNLOCK_DOOR) -- message from "inside" of door
        npc:openDoor(ANIMATION_OPEN_DOOR)
    end
end

function onEventUpdate(player,csid,option,target)
    -- printf("CSID: %u",csid)
    -- printf("RESULT: %u",option)
end

function onEventFinish(player,csid,option,target)
    -- printf("CSID: %u",csid)
    -- printf("RESULT: %u",option)
end