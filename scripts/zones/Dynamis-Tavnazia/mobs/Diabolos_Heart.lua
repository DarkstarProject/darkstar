-----------------------------------
-- Area:
--  MOB: Diabolos_Heart
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/keyitems");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer, ally)
    if (ally:hasKeyItem(DYNAMIS_TAVNAZIA_SLIVER ) == false) then
        ally:addKeyItem(DYNAMIS_TAVNAZIA_SLIVER);
        ally:messageSpecial(KEYITEM_OBTAINED,DYNAMIS_TAVNAZIA_SLIVER);
    end
    ally:addTitle(NIGHTMARE_AWAKENER);
end;