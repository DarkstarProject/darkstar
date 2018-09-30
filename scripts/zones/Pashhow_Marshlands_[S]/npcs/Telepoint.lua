-----------------------------------
-- Area: Pashhow Marshlands [S]
--  NPC: Telepoint
-----------------------------------
require("scripts/globals/keyitems");
local ID = require("scripts/zones/Pashhow_Marshlands_[S]/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:hasKeyItem(dsp.ki.PASHHOW_GATE_CRYSTAL) == false) then
        player:addKeyItem(dsp.ki.PASHHOW_GATE_CRYSTAL);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.PASHHOW_GATE_CRYSTAL);
    else
        player:messageSpecial(ID.text.ALREADY_OBTAINED_TELE);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;