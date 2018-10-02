-----------------------------------
-- Area: Castle Oztroja
--  NPC: Brass Door
-- Notes: Open by handle (I-8)
-- !pos 20 0.5 -13 151
-----------------------------------
local ID = require("scripts/zones/Castle_Oztroja/IDs");
-----------------------------------

function onTrigger(player,npc)

    if (npc:getAnimation() == 9) then
        player:messageSpecial(ID.text.ITS_LOCKED);
        return 1;
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("upCSID: %u",csid);
    -- printf("upRESULT: %u",option);
end;

function onEventFinish(player,csid,option)
end;