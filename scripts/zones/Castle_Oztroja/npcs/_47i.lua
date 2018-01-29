-----------------------------------
-- Area:  Castle Oztroja
-- NPC:   _47i (Handle)
-- Notes: Opens door _471
-- !pos -182 -15 -19 151
-----------------------------------
require("scripts/zones/Castle_Oztroja/MobIDs");
require("scripts/globals/settings");
require("scripts/globals/status");

function onTrigger(player,npc)
    local DoorID = npc:getID()-5;
    local DoorA = GetNPCByID(DoorID):getAnimation();

    if (DoorA == ANIMATION_CLOSE_DOOR and npc:getAnimation() == ANIMATION_CLOSE_DOOR) then
        npc:setAnimation(ANIMATION_OPEN_DOOR);
    elseif (DoorA == ANIMATION_CLOSE_DOOR and npc:getAnimation() == ANIMATION_OPEN_DOOR) then
        npc:setAnimation(ANIMATION_CLOSE_DOOR);
    end

    npc:timer(1500, function(npc)
        if (npc:getAnimation() == OZ_HANDLE_TABLE[Oz_handleSet][npc:getID()+34]
            and GetNPCByID(npc:getID()-3):getAnimation() == OZ_HANDLE_TABLE[Oz_handleSet][npc:getID()+31]
            and GetNPCByID(npc:getID()-2):getAnimation() == OZ_HANDLE_TABLE[Oz_handleSet][npc:getID()+32]
            and GetNPCByID(npc:getID()-1):getAnimation() == OZ_HANDLE_TABLE[Oz_handleSet][npc:getID()+33]) then
                GetNPCByID(DoorID):openDoor(6);
                for i = npc:getID()-3, npc:getID(), 1 do GetNPCByID(i):setAnimation(ANIMATION_CLOSE_DOOR); end
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