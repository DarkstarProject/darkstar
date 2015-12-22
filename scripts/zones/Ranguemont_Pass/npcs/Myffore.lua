-----------------------------------
--  Area: Ranguemont Pass
--  NPC:  Myffore
--  Type: NPC
--  @pos -179.951 4 -172.234 166
-----------------------------------
package.loaded["scripts/zones/Ranguemont_Pass/TextIDs"] = nil;
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(0x0001);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option,npc)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x0001 and option == 0) then
        local DoorID = npc:getID()+1;
        GetNPCByID(DoorID):openDoor(10);
    end
end;

