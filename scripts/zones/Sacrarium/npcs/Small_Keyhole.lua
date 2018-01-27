-----------------------------------
--  NPC: Small Keyhole
-- Area: Sacrarium
-- !pos 99.772 -1.614 51.545 28
-----------------------------------
package.loaded["scripts/zones/Sacrarium/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Sacrarium/TextIDs");
-----------------------------------

function onTrigger(player,npc)

    local SmallKeyholeID = npc:getID();
    local DoorID = GetNPCByID(SmallKeyholeID):getID() - 3;

    if (player:hasKeyItem(TEMPLE_KNIGHT_KEY)) then
        GetNPCByID(DoorID):openDoor(15);
    else
        player:messageSpecial(SMALL_KEYHOLE);
    end
end;

function onTrade(player,npc,trade)

    if (trade:hasItemQty(1659,1) and trade:getItemCount() == 1) then
        player:messageSpecial(CORAL_KEY_TRADE);
        SetServerVariable("SACRARIUM_Coral_Key_trade",os.time());
        player:tradeComplete();
        -- print(os.time());
    end
end;

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end;
