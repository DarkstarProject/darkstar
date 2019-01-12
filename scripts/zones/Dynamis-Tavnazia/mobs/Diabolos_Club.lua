-----------------------------------
-- Area: Dynamis-Tavnazia
--  MOB: Diabolos_Club
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
    -- despawn diabolos 's pet
    if (GetMobAction(16949253)~=0) then
        DespawnMob(16949253);
    end
    if (GetMobAction(16949254)~=0) then
        DespawnMob(16949254);
    end

    player:addTitle(dsp.title.NIGHTMARE_AWAKENER);
end;