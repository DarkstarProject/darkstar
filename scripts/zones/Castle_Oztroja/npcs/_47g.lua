-----------------------------------
-- Area:  Castle Oztroja
-- NPC:   _47g (Handle)
-- Notes: Opens door _471
-- !pos -182 -15 -19 151
-----------------------------------
require("scripts/zones/Castle_Oztroja/MobIDs");
require("scripts/globals/settings");
require("scripts/globals/status");

function onTrigger(player,npc)
    local DoorID = npc:getID()-3;
    local DoorA = GetNPCByID(DoorID):getAnimation();

    if (DoorA == dsp.anim.CLOSE_DOOR and npc:getAnimation() == dsp.anim.CLOSE_DOOR) then
        npc:setAnimation(dsp.anim.OPEN_DOOR);
    elseif (DoorA == dsp.anim.CLOSE_DOOR and npc:getAnimation() == dsp.anim.OPEN_DOOR) then
        npc:setAnimation(dsp.anim.CLOSE_DOOR);
    end

    npc:timer(1500, function(npc)
        if (npc:getAnimation() == OZ_HANDLE_TABLE[Oz_handleSet][npc:getID()+34]
            and GetNPCByID(npc:getID()-1):getAnimation() == OZ_HANDLE_TABLE[Oz_handleSet][npc:getID()+33]
            and GetNPCByID(npc:getID()+1):getAnimation() == OZ_HANDLE_TABLE[Oz_handleSet][npc:getID()+35]
            and GetNPCByID(npc:getID()+2):getAnimation() == OZ_HANDLE_TABLE[Oz_handleSet][npc:getID()+36]) then
                GetNPCByID(DoorID):openDoor(6);
                for i = npc:getID()-1, npc:getID()+2, 1 do GetNPCByID(i):setAnimation(dsp.anim.CLOSE_DOOR); end
        end
    end);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;