-----------------------------------
-- Area: Meriphataud Mountains [S]
--  NPC: Telepoint
-----------------------------------
require("scripts/globals/keyitems");
local ID = require("scripts/zones/Meriphataud_Mountains_[S]/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:hasKeyItem(dsp.ki.MERIPHATAUD_GATE_CRYSTAL) == false) then
        player:addKeyItem(dsp.ki.MERIPHATAUD_GATE_CRYSTAL);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.MERIPHATAUD_GATE_CRYSTAL);
    else
        player:messageSpecial(ID.text.ALREADY_OBTAINED_TELE);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;