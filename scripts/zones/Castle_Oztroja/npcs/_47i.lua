-----------------------------------
-- Area:  Castle Oztroja
-- NPC:   _47i (Handle)
-- Notes: Opens door _471
-- !pos -182 -15 -19 151
-----------------------------------

require("scripts/globals/settings");

function onTrigger(player,npc)
    local DoorID = npc:getID()-5;
    local DoorA = GetNPCByID(DoorID):getAnimation();

    if (DoorA == 9 and npc:getAnimation() == 9) then
        npc:setAnimation(8);
    elseif (DoorA == 9 and npc:getAnimation() == 8) then
        npc:setAnimation(9);
    end

    npc:timer(1500, function(npc)
        if (npc:getAnimation() == Oz_Handle_Table[Oz_handleSet][npc:getID()+34]
            and GetNPCByID(npc:getID()-3):getAnimation() == Oz_Handle_Table[Oz_handleSet][npc:getID()+31]
            and GetNPCByID(npc:getID()-2):getAnimation() == Oz_Handle_Table[Oz_handleSet][npc:getID()+32]
            and GetNPCByID(npc:getID()-1):getAnimation() == Oz_Handle_Table[Oz_handleSet][npc:getID()+33]) then
                GetNPCByID(DoorID):openDoor(6);
                for i = npc:getID()-3, npc:getID(), 1 do GetNPCByID(i):setAnimation(9); end
        end
    end);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;