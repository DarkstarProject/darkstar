-----------------------------------
-- Area: Dynamis-Tavnazia
--  MOB: Diabolos_Heart
-----------------------------------
local ID = require("scripts/zones/Dynamis-Tavnazia/IDs")
require("scripts/globals/titles");
require("scripts/globals/keyitems");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if (player:hasKeyItem(dsp.ki.DYNAMIS_TAVNAZIA_SLIVER ) == false) then
        player:addKeyItem(dsp.ki.DYNAMIS_TAVNAZIA_SLIVER);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.DYNAMIS_TAVNAZIA_SLIVER);
    end
    player:addTitle(dsp.title.NIGHTMARE_AWAKENER);
end;