-----------------------------------
-- Area: Western Altepa Desert
--  NPC: _3h7 (Emerald Column)
-- Notes: Mechanism for Altepa Gate
-- !pos -775 2 -460 125
-----------------------------------
package.loaded["scripts/zones/Western_Altepa_Desert/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Western_Altepa_Desert/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local EmeraldID = npc:getID();
    local Ruby = GetNPCByID(EmeraldID-2):getAnimation();
    local Topaz = GetNPCByID(EmeraldID-1):getAnimation();
    local Emerald = npc:getAnimation();
    local Sapphire = GetNPCByID(EmeraldID+1):getAnimation();

    if (Emerald ~= 8) then
        npc:setAnimation(8);
        GetNPCByID(EmeraldID-4):setAnimation(8);
    else
        player:messageSpecial(DOES_NOT_RESPOND);
    end

    if (Sapphire == 8 and Ruby == 8 and Topaz == 8) then
        local rand = math.random(15,30);
        local timeDoor = rand * 60;

        -- Add timer for the door
        GetNPCByID(EmeraldID-7):openDoor(timeDoor);
        -- Add same timer for the 4 center lights
        GetNPCByID(EmeraldID-6):openDoor(timeDoor);
        GetNPCByID(EmeraldID-5):openDoor(timeDoor);
        GetNPCByID(EmeraldID-4):openDoor(timeDoor);
        GetNPCByID(EmeraldID-3):openDoor(timeDoor);
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