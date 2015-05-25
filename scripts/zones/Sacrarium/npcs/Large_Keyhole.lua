-----------------------------------
-- Area:  Sacrarium
-- NPC:   Large Keyhole
-- Notes: Used to open R. Gate
-- @pos 100.231 -1.414 51.700 28
-----------------------------------
package.loaded["scripts/zones/Sacrarium/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Sacrarium/TextIDs");	

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local LargeKeyholeID = npc:getID();
    local DoorID = GetNPCByID(LargeKeyholeID):getID() - 2;

    if (player:hasKeyItem(TEMPLE_KNIGHT_KEY)) then
        GetNPCByID(DoorID):openDoor(15);
    else
        player:messageSpecial(LARGE_KEYHOLE);
  end
end;

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    local Timemax=GetServerVariable("SACRARIUM_Coral_Key_trade")+10;
    local CurentTime=os.time();
    local LargeKeyholeID = npc:getID();
    local DoorID = GetNPCByID(LargeKeyholeID):getID() - 2;

    if (trade:hasItemQty(1658,1) and trade:getItemCount() == 1) then
        if (CurentTime < Timemax)then
            GetNPCByID(DoorID):openDoor(15);
            SetServerVariable("SACRARIUM_Coral_Key_trade",0);
        end
    end

end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
end;
