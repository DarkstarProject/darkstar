-----------------------------------
-- Area: Riverne Site #A01
--  NPC: Unstable Displacement
-----------------------------------
package.loaded["scripts/zones/Riverne-Site_A01/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Riverne-Site_A01/TextIDs");
require("scripts/zones/Riverne-Site_A01/MobIDs");
require("scripts/globals/settings");
require("scripts/globals/status");
-----------------------------------

function onTrade(player,npc,trade)
    local offset = npc:getID() - RIV_A_DISPLACEMENT_OFFSET;
    if (offset == 5 and TradeBCNM(player,player:getZoneID(),trade,npc)) then -- The Wyrmking Descends
        return;
    elseif (offset ~= 5 and trade:hasItemQty(1691,1) and trade:getItemCount() == 1) then
        player:tradeComplete();
        npc:openDoor(RIVERNE_PORTERS);
        player:messageSpecial(SD_HAS_GROWN);
    end
end;

function onTrigger(player,npc)
    local offset = npc:getID() - RIV_A_DISPLACEMENT_OFFSET;
    player:PrintToPlayer(offset);

    -- OURYU COMETH
    if (offset == 5) then
        player:messageSpecial(SPACE_SEEMS_DISTORTED);

    -- GIANT SCALE DISPLACEMENTS
    else
        if (npc:getAnimation() == ANIMATION_OPEN_DOOR) then
            player:startEvent(offset);
        else
            player:messageSpecial(SD_VERY_SMALL);
        end
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
