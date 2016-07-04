-----------------------------------
-- Area:  Phomiuna Aqueducts
-- NPC:   qm10 (???)
-- Notes: Opens south door @ J-7
-- @pos 113.474 -26.000 91.610 27
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

    local DoorOffset = npc:getID() - 63;
    
    if (GetNPCByID(DoorOffset):getAnimation() == 9) then
        GetNPCByID(DoorOffset):openDoor(7); -- _0rh
    end    
    
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;