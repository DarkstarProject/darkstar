-----------------------------------
-- Area:
--  MOB: Diabolos_Heart
-----------------------------------
require("scripts/globals/titles");
require("scripts/globals/keyitems");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    if (player:hasKeyItem(DYNAMIS_TAVNAZIA_SLIVER ) == false) then
        player:addKeyItem(DYNAMIS_TAVNAZIA_SLIVER);
        player:messageSpecial(KEYITEM_OBTAINED,DYNAMIS_TAVNAZIA_SLIVER);
    end
    player:addTitle(NIGHTMARE_AWAKENER);
end;