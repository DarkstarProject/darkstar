-----------------------------------
-- Area: Phomiuna_Aqueducts
--  NPC: Oil lamp
-- !pos -60 -23 60 27
-----------------------------------
require("scripts/globals/missions");
local ID = require("scripts/zones/Phomiuna_Aqueducts/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local DoorOffset = npc:getID();

    player:messageSpecial(ID.text.LAMP_OFFSET+6); -- light lamp
    npc:openDoor(7); -- lamp animation

    local element = VanadielDayElement();
    -- printf("element: %u",element);

    if (element == 6 or element == 7) then -- lightday or darkday
        if (GetNPCByID(DoorOffset+1):getAnimation() == 8) then -- lamp dark open?
            GetNPCByID(DoorOffset-5):openDoor(15); -- Open Door _0rk
        end
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;