-----------------------------------
-- Area: Leujaoam Sanctum
-----------------------------------

require("scripts/globals/besieged")
require("scripts/zones/Leujaoam_Sanctum/IDs");

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
        player:startEvent(100,0);
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
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
    
    if (csid == 100 and option == 1) then
        local instance = player:getInstance()
        local chars = instance:getChars();
        
        local id = instance:getID();
        local points = 0;
        
        if (id == 1) then
            points = 1000 - math.max(0, #chars - 3);
        end
        for i,v in pairs(chars) do
            v:messageSpecial(Leujaoam.text.ASSAULT_POINTS_OBTAINED,points);
            v:addAssaultPoint(LEUJAOAM_ASSAULT_POINT,points);
            v:setVar("AssaultComplete",1);
            if (v:hasCompletedAssault(v:getCurrentAssault())) then
                v:setVar("AssaultPromotion", v:getVar("AssaultPromotion")+1);
            else
                v:setVar("AssaultPromotion", v:getVar("AssaultPromotion")+5);
            end
            
            if (v ~= player) then
                v:startEvent(102);
            end
        end
    end
    
end;