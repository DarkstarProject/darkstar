-----------------------------------
-- Area: Gusgen Mines
--  NPC: _5g5 (Door D)
-- !pos -4.001 -22.4 174.498 196
-----------------------------------
local ID = require("scripts/zones/Gusgen_Mines/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (npc:getAnimation() == 9) then
        player:messageSpecial(ID.text.LOCK_OTHER_DEVICE)
    else
        return 0;
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;