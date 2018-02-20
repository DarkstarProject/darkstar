-----------------------------------
-- Area: Fort Karugo-Narugo [S]
--  MOB: War Lynx
-- The Tigress Strikes Fight
-----------------------------------
require("scripts/globals/missions");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)

    if (player:getQuestStatus(CRYSTAL_WAR, THE_TIGRESS_STRIKES) == QUEST_ACCEPTED) then
        player:needToZone(true);
        player:setVar("WarLynxKilled",1);
    end

end;