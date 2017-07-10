-----------------------------------
--  Area: West Ronfaure
--  NPC:  Signpost
--  @zone 100
-----------------------------------
package.loaded["scripts/zones/West_Ronfaure/TextIDs"] = nil;
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
    if (npc:getID() == 17187536) then
        player:startEvent(107);
    elseif (npc:getID() == 17187505) then
        player:startEvent(108);
    elseif (npc:getID() == 17187506) then
        player:startEvent(109);
    elseif (npc:getID() == 17187507) then
        player:startEvent(110);
    elseif (npc:getID() == 17187508) then
        player:startEvent(115);
    end
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

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

