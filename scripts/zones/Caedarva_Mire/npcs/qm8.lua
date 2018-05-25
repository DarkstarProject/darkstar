-----------------------------------
-- Area: Caedarva Mire
-- NPC:  qm8
-- Gives Lamian Fang Key
-----------------------------------
package.loaded["scripts/zones/Caedarva_Mire/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Caedarva_Mire/TextIDs")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local fangKeyTimer = player:getVar("[TIMER]Lamian Fang Key")

    if fangKeyTimer < os.time() then
        if player:getFreeSlotsCount() > 0 and player:hasItem(2219) == false then
            player:addItem(2219,1)
            player:messageSpecial(ITEM_OBTAINED,2219)
            player:setVar("[TIMER]Lamian Fang Key",getConquestTally())
        else
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,2219)
        end
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end