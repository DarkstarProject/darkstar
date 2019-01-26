-----------------------------------
-- Area: The_Shrouded_Maw
-- Name: waking_dreams
-----------------------------------
local ID = require("scripts/zones/The_Shrouded_Maw/IDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/status");
require("scripts/globals/titles");

-- After registering the BCNM via bcnmRegister(bcnmid)
function onBcnmRegister(player,instance)
    -- "close" all floor tiles
    local inst = player:getBattlefieldID();
    local tile = ID.npc.DARKNESS_NAMED_TILE_OFFSET + (inst - 1) * 8;
    for i = tile, tile + 7 do
        GetNPCByID(i):setAnimation(dsp.anim.CLOSE_DOOR);
    end
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBcnmEnter(player,instance)
end;

-- Leaving the BCNM by every mean possible, given by the LeaveCode
-- 1=Select Exit on circle
-- 2=Winning the BC
-- 3=Disconnected or warped out
-- 4=Losing the BC
-- via bcnmLeave(1) or bcnmLeave(2). LeaveCodes 3 and 4 are called
-- from the core when a player disconnects or the time limit is up, etc

function onBcnmLeave(player,instance,leavecode)
    if (leavecode == 2) then -- play end CS. Need time and battle id for record keeping + storage
        if (player:hasKeyItem(dsp.ki.VIAL_OF_DREAM_INCENSE)) then
            player:delKeyItem(dsp.ki.VIAL_OF_DREAM_INCENSE);
            player:addKeyItem(dsp.ki.WHISPER_OF_DREAMS);
            player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.WHISPER_OF_DREAMS);
        end
        player:addTitle(dsp.title.HEIR_TO_THE_REALM_OF_DREAMS);
        player:startEvent(32002);
    elseif (leavecode == 4) then
        player:startEvent(32002);
    end
end;

function onEventUpdate(player,csid,option)
end;
        
function onEventFinish(player,csid,option)
end;
