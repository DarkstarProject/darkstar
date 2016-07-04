-----------------------------------
-- Area: The Eldieme Necropolis
-- NPC:  South Plate
-- @pos 180 -34 -31 195
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
    local state0 = 8;
    local state1 = 9;
    local DoorOffset = npc:getID() - 26; -- _5f1
    
    if (npc:getAnimation() == 8) then
        state0 = 9;
        state1 = 8;
    end
    -- Gates
    -- Shiva's Gate
    GetNPCByID(DoorOffset):setAnimation(state0);
    GetNPCByID(DoorOffset+1):setAnimation(state0);
    GetNPCByID(DoorOffset+2):setAnimation(state0);
    GetNPCByID(DoorOffset+3):setAnimation(state0);
    GetNPCByID(DoorOffset+4):setAnimation(state0);
    -- Odin's Gate
    GetNPCByID(DoorOffset+5):setAnimation(state1);
    GetNPCByID(DoorOffset+6):setAnimation(state1);
    GetNPCByID(DoorOffset+7):setAnimation(state1);
    GetNPCByID(DoorOffset+8):setAnimation(state1);
    GetNPCByID(DoorOffset+9):setAnimation(state1);
    -- Leviathan's Gate
    GetNPCByID(DoorOffset+10):setAnimation(state0);
    GetNPCByID(DoorOffset+11):setAnimation(state0);
    GetNPCByID(DoorOffset+12):setAnimation(state0);
    GetNPCByID(DoorOffset+13):setAnimation(state0);
    GetNPCByID(DoorOffset+14):setAnimation(state0);
    -- Titan's Gate
    GetNPCByID(DoorOffset+15):setAnimation(state1);
    GetNPCByID(DoorOffset+16):setAnimation(state1);
    GetNPCByID(DoorOffset+17):setAnimation(state1);
    GetNPCByID(DoorOffset+18):setAnimation(state1);
    GetNPCByID(DoorOffset+19):setAnimation(state1);
    
    -- Plates
    -- East Plate
    GetNPCByID(DoorOffset+20):setAnimation(state0);
    GetNPCByID(DoorOffset+21):setAnimation(state0);
    -- North Plate
    GetNPCByID(DoorOffset+22):setAnimation(state0);
    GetNPCByID(DoorOffset+23):setAnimation(state0);
    -- West Plate
    GetNPCByID(DoorOffset+24):setAnimation(state0);
    GetNPCByID(DoorOffset+25):setAnimation(state0);
    -- South Plate
    GetNPCByID(DoorOffset+26):setAnimation(state0);
    GetNPCByID(DoorOffset+27):setAnimation(state0);
    return 0;
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