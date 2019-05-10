-----------------------------------
-- Area: Korroloka Tunnel
--  MOB: Korroloka Leech
--  Involved in Quest: Ayame and Kaede
-----------------------------------
local ID = require("scripts/zones/Korroloka_Tunnel/IDs");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/quests");

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 180);
end;

function onMobSpawn(mob)
    DespawnMob(mob:getID(), 180);
end;

function onMobDeath(mob, player, isKiller)
    if (GetMobByID(ID.mob.KORROLOKA_LEECH_I):isDead() and GetMobByID(ID.mob.KORROLOKA_LEECH_II):isDead() and GetMobByID(ID.mob.KORROLOKA_LEECH_III):isDead()) then
        if (player:getQuestStatus(BASTOK,dsp.quest.id.bastok.AYAME_AND_KAEDE) == QUEST_ACCEPTED and player:getVar("AyameAndKaede_Event") == 2) then
            player:setVar("KorrolokaLeeches_Killed", 1);
        end
    end
end;
