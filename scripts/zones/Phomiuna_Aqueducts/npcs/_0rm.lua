-----------------------------------
-- Area: Phomiuna_Aqueducts
--  NPC: _0rm (Oil lamp)
-- Notes: Opens South door at J-7 from inside.
-- !pos -63.703 -26.227 83.000 27
-----------------------------------
package.loaded["scripts/zones/Phomiuna_Aqueducts/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/missions");
require("scripts/zones/Phomiuna_Aqueducts/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local DoorOffset = npc:getID() - 1;

    if (GetNPCByID(DoorOffset):getAnimation() == 9) then
        if (player:getZPos() < 84) then
            npc:openDoor(15); -- lamp animation
            GetNPCByID(DoorOffset):openDoor(7); -- _0rf
        end
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;