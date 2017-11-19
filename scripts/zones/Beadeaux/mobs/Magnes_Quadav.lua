-----------------------------------
--  Area: Beadeaux
--  MOB: Magnes Quadav
--  Involved in Quests: For the Birds
--  !zone 147
-----------------------------------
package.loaded["scripts/zones/Beadeaux/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Beadeaux/TextIDs");

-----------------------------------
-- OnMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- OnMobDeath Action
-----------------------------------
function onMobDeath(mob, player, isKiller)
    local quadavsKilled = player:getVar("BirdsQuestQuadavsKilled");
    player:setVar("BirdsQuestQuadavsKilled",quadavsKilled + 1);
    SetServerVariable("ForTheBirds_5min_wait", os.time() + 300);  -- 5 min wait to repop
end;