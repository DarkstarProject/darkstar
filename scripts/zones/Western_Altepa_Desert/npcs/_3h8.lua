-----------------------------------
-- Area:  Western Altepa Desert
-- NPC:   _3h8 (Sapphire Column)
-- Notes: Mechanism for Altepa Gate
-- @pos -499 10 224 125
-----------------------------------
package.loaded["scripts/zones/Western_Altepa_Desert/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Western_Altepa_Desert/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local SapphireID = npc:getID();
    local Ruby = GetNPCByID(SapphireID-3):getAnimation();
    local Topaz = GetNPCByID(SapphireID-2):getAnimation();
    local Emerald = GetNPCByID(SapphireID-1):getAnimation();
    local Sapphire = npc:getAnimation();

    if (Sapphire ~= 8) then
        npc:setAnimation(8);
        GetNPCByID(SapphireID-4):setAnimation(8);
    else
        player:messageSpecial(DOES_NOT_RESPOND);
    end

    if (Emerald == 8 and Ruby == 8 and Topaz == 8) then
        local rand = math.random(15,30);
        local timeDoor = rand * 60;

        -- Add timer for the door
        GetNPCByID(SapphireID-8):openDoor(timeDoor);
        -- Add same timer for the 4 center lights
        GetNPCByID(SapphireID-7):openDoor(timeDoor);
        GetNPCByID(SapphireID-6):openDoor(timeDoor);
        GetNPCByID(SapphireID-5):openDoor(timeDoor);
        GetNPCByID(SapphireID-4):openDoor(timeDoor);
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