-----------------------------------
-- Area: Fort Karugo-Narugo [S]
--  MOB: War Lynx
-- The Tigress Strikes Fight
-----------------------------------

require("scripts/globals/missions");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob,killer,ally)

    if (ally:getQuestStatus(CRYSTAL_WAR, THE_TIGRESS_STRIKES) == QUEST_ACCEPTED) then
        ally:needToZone(true);
        ally:setVar("WarLynxKilled",1);
    end

end;