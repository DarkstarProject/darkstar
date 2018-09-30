-----------------------------------
-- Area: Castle Oztroja
--  NPC: _m71 (Torch Stand)
-- Involved in Mission: Magicite
-- !pos -99 24 -105 151
-----------------------------------
require("scripts/globals/keyitems");
local ID = require("scripts/zones/Castle_Oztroja/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:hasKeyItem(dsp.ki.YAGUDO_TORCH)) then
        player:startEvent(11);
    else
        player:messageSpecial(ID.text.PROBABLY_WORKS_WITH_SOMETHING_ELSE);
    end

    return 1;

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;