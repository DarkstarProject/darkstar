-----------------------------------
-- Area: Ilrusi Atoll
--  NPC: Rune of Release
-- !pos 412 -9 54 55
-----------------------------------
local ID = require("scripts/zones/Ilrusi_Atoll/IDs")
require("scripts/globals/besieged")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local instance = npc:getInstance()

    if (instance:completed()) then
        player:startEvent(100,4)
    end

    return 1
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    local instance = player:getInstance()
    local chars = instance:getChars()
    local id = instance:getID()
    local points = 0
    local playerpoints = ((#chars -3)*100)

    if (csid == 100 and option == 1) then
        if id == 41 or id == 43 then
            points = 1100 - math.max(playerpoints, 0)
        end
        for i,v in pairs(chars) do
            v:messageSpecial(ID.text.ASSAULT_POINTS_OBTAINED,points)
            v:addAssaultPoint(ILRUSI_ASSAULT_POINT,points)
            v:setVar("AssaultComplete",1)
            if (v:hasCompletedAssault(v:getCurrentAssault())) then
                v:addVar("AssaultPromotion", 1)
            else
                v:addVar("AssaultPromotion", 5)
            end
            v:startEvent(102)
        end
    end
    if csid == 102 then
        for i,v in pairs(chars) do
            v:setPos(0,0,0,0,54)
        end
    end
end