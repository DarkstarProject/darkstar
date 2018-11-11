-----------------------------------
--
-- Zone: Arrapago Remnants
--
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/status")
-----------------------------------

function onInitialize(zone) --teleporters up
    zone:registerRegion(1, 420, 5, -339, 0, 0, 0)
    zone:registerRegion(2, 420, 5, -499, 0, 0, 0)
    zone:registerRegion(3, 259, 5, -499, 0, 0, 0)
    zone:registerRegion(4, 259, 5, -339, 0, 0, 0)
    zone:registerRegion(5, 340, 5, 100, 0, 0, 0)
    zone:registerRegion(6, 339, 5, 419, 0, 0, 0)
    zone:registerRegion(7, 339, 5, 500, 0, 0, 0)
    zone:registerRegion(8, -379, 5, -620, 0, 0, 0)
    zone:registerRegion(9, -300, 5, -461, 0, 0, 0)
    zone:registerRegion(10, -339, 5, -99, 0, 0, 0)
    zone:registerRegion(11, -339, 5, 300, 0, 0, 0)
end;

function onInstanceZoneIn(player,instance)
    local cs = -1;

    local pos = player:getPos();
    if (pos.x == 0 and pos.y == 0 and pos.z == 0) then
        local entrypos = instance:getEntryPos();
        player:setPos(entrypos.x, entrypos.y, entrypos.z, entrypos.rot);
    end
    
    -- CLEARS ENTRY VAR USED TO DETERMINE WHICH ZONE TO GO TO
    player:setVar("SalvageArrapago", 0);

    player:addTempItem(5399);
end;

function onRegionEnter(player,region,instance)
end;

function onEventUpdate(player,csid,option)
   
end;

function onEventFinish(player, csid, option)
    local instance = player:getInstance()
    local chars = instance:getChars()
    printf("csid: %s option: %s", csid, option)

    if csid == 1 then
        for i,v in pairs(chars) do
            v:setPos(0,0,0,0,72)
        end
    end
end;

function onInstanceLoadFailed()
    return 72;
end;