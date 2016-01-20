-----------------------------------
-- Area: Lebros Cavern
-----------------------------------

require("scripts/zones/Lebros_Cavern/IDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    local instance = npc:getInstance();
    
    if (instance:completed()) then
        player:startEvent(100,2);
    end
    
    return 1;
    
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
 printf("CSID: %u",csid);
 printf("RESULT: %u",option);
    
    if (csid == 100 and option == 1) then
        local instance = player:getInstance()
        local chars = instance:getChars();
        
        for i,v in pairs(chars) do
            -- TODO: calcualte assault points, add assault points
            v:messageSpecial(Lebros.text.ASSAULT_POINTS_OBTAINED,0);
            -- v:addAssaultPoint(LEBROS_ASSAULT_POINT,points);
            v:setVar("AssaultComplete",1);
            v:startEvent(102);
        end
    end
    
end;