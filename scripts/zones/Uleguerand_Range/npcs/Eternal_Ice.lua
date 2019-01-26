-----------------------------------
-- Area: Uleguerand Range
--  NPC: Eternal Ice
--  Gives key item Mystic Ice upon examining
-- !pos 575 -26 -101 5
-- !pos 455 -82 421 5
-- !pos -95 -146 378 5
-----------------------------------
require("scripts/globals/keyitems");
local ID = require("scripts/zones/Uleguerand_Range/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:hasKeyItem(dsp.ki.MYSTIC_ICE) == false) then
        player:addKeyItem(dsp.ki.MYSTIC_ICE);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.MYSTIC_ICE);
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY);
    end
end;