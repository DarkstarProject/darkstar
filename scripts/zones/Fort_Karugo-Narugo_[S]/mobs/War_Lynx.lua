-----------------------------------
-- Area: Fort Karugo-Narugo [S]
--  MOB: War Lynx
-- The Tigress Strikes Fight
-----------------------------------
require("scripts/zones/Fort_Karugo-Narugo_[S]/MobIDs");
require("scripts/globals/quests");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    if (mob:getID() == TIGRESS_STRIKES_WAR_LYNX and player:getQuestStatus(CRYSTAL_WAR, THE_TIGRESS_STRIKES) == QUEST_ACCEPTED) then
        player:setVar("WarLynxKilled",1);
    end
end;
