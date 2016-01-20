-----------------------------------
-- Area: Ranguemont Pass
--  NM:  Tros
-- Used in Quests: Painful Memory
-- @pos -289 -45 212 166
-----------------------------------

require("scripts/globals/keyitems");

-----------------------------------
-- OnMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- OnMobDeath Action
-----------------------------------

function onMobDeath(mob, killer, ally)
    if (ally:hasKeyItem(MERTAIRES_BRACELET)) then
        ally:setVar("TrosKilled",1);
        ally:setVar("Tros_Timer",os.time());
    end
end;