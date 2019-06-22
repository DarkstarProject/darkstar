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

    player:messageSpecial(ID.text.LAMP_OFFSET+4); -- ice lamp
    npc:openDoor(7); -- lamp animation

    local element = VanadielDayElement();
    -- printf("element: %u",element);

    if (element == 0) then -- fireday
        if (GetNPCByID(DoorOffset+6):getAnimation() == 8) then -- lamp fire open?
            GetNPCByID(DoorOffset-3):openDoor(15); -- Open Door _0rk
        end
    elseif (element == 4) then -- iceday
        if (GetNPCByID(DoorOffset+5):getAnimation() == 8) then -- lamp wind open?
            GetNPCByID(DoorOffset-3):openDoor(15); -- Open Door _0rk
        end
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;