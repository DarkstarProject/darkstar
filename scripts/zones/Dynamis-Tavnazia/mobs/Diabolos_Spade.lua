-----------------------------------
-- Area:
--  MOB: Diabolos_Spade
-----------------------------------
require("scripts/globals/titles");
require("scripts/globals/keyitems");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    if (player:hasKeyItem(dsp.kis.DYNAMIS_TAVNAZIA_SLIVER ) == false) then
        player:addKeyItem(dsp.kis.DYNAMIS_TAVNAZIA_SLIVER);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.kis.DYNAMIS_TAVNAZIA_SLIVER);
    end
    player:addTitle(NIGHTMARE_AWAKENER);
end;