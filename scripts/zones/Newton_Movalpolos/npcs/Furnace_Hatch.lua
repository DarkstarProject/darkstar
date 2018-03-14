-----------------------------------
-- Area: Newton Movalpolos
--  NPC: Furnace_Hatch
-----------------------------------
package.loaded["scripts/zones/Newton_Movalpolos/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Newton_Movalpolos/TextIDs");
require("scripts/zones/Newton_Movalpolos/MobIDs");
require("scripts/globals/npc_util");
require("scripts/globals/status");
-----------------------------------

function onTrade(player,npc,trade)
    if (npcUtil.tradeHas(trade, 947)) then
        local offset = npc:getID() - FURNACE_HATCH_OFFSET;
        player:confirmTrade();
        player:startEvent(21 + offset); -- THUD!

        -- toggle open/closed the four doors related to this hatch
        local doorOffset = NEWTON_DOOR_OFFSET + (math.min(offset, 2) * 4);
        for i = doorOffset, doorOffset + 3 do
            local door = GetNPCByID(i);
            door:setAnimation((door:getAnimation() == ANIMATION_OPEN_DOOR) and ANIMATION_CLOSE_DOOR or ANIMATION_OPEN_DOOR);
        end
    else
        player:startEvent(20); -- no firesand message
    end
end;

function onTrigger(player,npc)
    player:startEvent(20); -- no firesand message
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
