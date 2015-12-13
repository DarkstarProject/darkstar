-----------------------------------
-- Area: Konschtat Highlands
--  NM:  Steelfleece_Baldarich
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer, ally)
    ally:addTitle(THE_HORNSPLITTER);
end;