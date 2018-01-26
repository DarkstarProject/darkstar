-----------------------------------
-- Area: Korroloka Tunnel
--  MOB: Korroloka Leech
--  Involved in Quest: Ayame and Kaede
-----------------------------------
require("scripts/zones/Korroloka_Tunnel/MobIDs");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/quests");

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_IDLE_DESPAWN, 180);
end;

function onMobSpawn(mob)
    DespawnMob(mob:getID(), 180);
end;

function onMobDeath(mob, player, isKiller)
    if (GetMobByID(KORROLOKA_LEECH_I):isDead() and GetMobByID(KORROLOKA_LEECH_II):isDead() and GetMobByID(KORROLOKA_LEECH_III):isDead()) then
        if (player:getQuestStatus(BASTOK,AYAME_AND_KAEDE) == QUEST_ACCEPTED and player:getVar("AyameAndKaede_Event") == 2) then
            player:setVar("KorrolokaLeeches_Killed", 1);
        end
    end
end;
