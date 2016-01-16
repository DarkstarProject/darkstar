-----------------------------------
-- Area: West Sarutabaruta
--  MOB: Krabkatoa
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
    ally:addTitle(ORCUS_TROPHY_HUNTER);
end;