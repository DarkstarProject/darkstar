-----------------------------------
-- Area: FeiYin
--  NM:  Dabotz's Ghost
-----------------------------------

require("scripts/globals/keyitems");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    if (player:hasKeyItem(AQUAFLORA3)) then
        player:setVar("DabotzKilled",1);
    end

end;