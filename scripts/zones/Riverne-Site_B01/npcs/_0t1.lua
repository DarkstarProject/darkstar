-----------------------------------
-- Area: Riverne Site #B01
--  NPC: Unstable Displacement
-----------------------------------
package.loaded["scripts/zones/Riverne-Site_B01/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Riverne-Site_B01/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/npc_util");
require("scripts/globals/status");
-----------------------------------

function onTrade(player,npc,trade)
    if (npcUtil.tradeHas(trade, 1691)) then
        player:confirmTrade();
        npc:openDoor(RIVERNE_PORTERS);
        player:messageSpecial(SD_HAS_GROWN);
    end
end;

function onTrigger(player,npc)
    if (npc:getAnimation() == ANIMATION_OPEN_DOOR) then
        player:startEvent(7);
    else
        player:messageSpecial(SD_VERY_SMALL);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
