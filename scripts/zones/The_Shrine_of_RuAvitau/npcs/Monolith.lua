-----------------------------------
-- Area: The Shrine of Ru'Avitau
-- NPC:  Monolith
-- !pos <many>
-----------------------------------
local ID = require("scripts/zones/The_Shrine_of_RuAvitau/IDs");
require("scripts/globals/status");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local offset = npc:getID() - ID.npc.SHRINE_MONOLITH_OFFSET;
    if (offset >= 0 and offset <= 38) then
        local colorTouched = ID.npc.SHRINE_MONOLITHS[offset / 2];
        for i = 0, 21 do
            local anim = ID.npc.SHRINE_DOORS[i] == colorTouched and dsp.anim.OPEN_DOOR or dsp.anim.CLOSE_DOOR;
            GetNPCByID(ID.npc.SHRINE_DOOR_OFFSET + i):setAnimation(anim);
        end
        for i = 0, 19 do
            local anim = ID.npc.SHRINE_MONOLITHS[i] == colorTouched and dsp.anim.OPEN_DOOR or dsp.anim.CLOSE_DOOR;
            GetNPCByID(ID.npc.SHRINE_MONOLITH_OFFSET + (i * 2) - 1):setAnimation(anim);
        end
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
