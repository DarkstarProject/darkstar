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

function onMobDeath(mob, killer, ally)

    if (ally:hasKeyItem(AQUAFLORA3)) then
        ally:setVar("DabotzKilled",1);
    end

end;