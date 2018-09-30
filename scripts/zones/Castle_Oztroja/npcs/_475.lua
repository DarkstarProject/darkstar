-----------------------------------
-- Area: Castle Oztroja
--  NPC: _475 (Brass Door)
-- Involved in Mission: Magicite
-- !pos -99 24 -105 151
-----------------------------------
require("scripts/globals/keyitems");
local ID = require("scripts/zones/Castle_Oztroja/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (npc:getAnimation() == 9) then
        player:messageSpecial(ID.text.ITS_LOCKED);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;