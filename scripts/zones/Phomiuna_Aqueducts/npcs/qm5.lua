-----------------------------------
-- Area:  Phomiuna Aqueducts
-- NPC:   qm5 (???)
-- Notes: Opens door @ F-8 from behind
-- @pos -65.512 -25.262 62.918 27
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

    local xPos = player:getXPos();
    local DoorOffset = npc:getID() - 1;
    
    if (GetNPCByID(DoorOffset):getAnimation() == 9) then
        if (xPos <= -65) then
            GetNPCByID(DoorOffset):openDoor(15) -- _0rk
        end
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