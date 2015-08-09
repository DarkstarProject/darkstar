-----------------------------------
-- Area: Fort Karugo-Narugo [S]
-- NPC:  War Lynx
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

function onMobDeath(mob,killer)

    if (killer:getQuestStatus(CRYSTAL_WAR, THE_TIGRESS_STRIKES) == QUEST_ACCEPTED) then
        killer:needToZone(true);
        killer:setVar("WarLynxKilled",1);
    end

end;