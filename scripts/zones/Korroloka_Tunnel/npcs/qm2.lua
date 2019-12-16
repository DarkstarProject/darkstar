-----------------------------------
-- Area: Korroloka Tunnel
--  NPC: ??? (qm2)
-- Involved In Quest: Ayame and Kaede
-- !pos -208 -9 176 173
-----------------------------------
local ID = require("scripts/zones/Korroloka_Tunnel/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/settings")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if player:getQuestStatus(BASTOK, dsp.quest.id.bastok.AYAME_AND_KAEDE) == QUEST_ACCEPTED then
        if player:getCharVar("AyameAndKaede_Event") == 2 and not player:hasKeyItem(dsp.ki.STRANGELY_SHAPED_CORAL) then
            if
                not GetMobByID(ID.mob.KORROLOKA_LEECH_I):isSpawned() and
                not GetMobByID(ID.mob.KORROLOKA_LEECH_II):isSpawned() and
                not GetMobByID(ID.mob.KORROLOKA_LEECH_III):isSpawned()
            then
                if player:getCharVar("KorrolokaLeeches_Killed") > 0 then
                    player:addKeyItem(dsp.ki.STRANGELY_SHAPED_CORAL)
                    player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.STRANGELY_SHAPED_CORAL)
                    player:setCharVar("KorrolokaLeeches_Killed", 0)

                    if player:getCharVar("KorrolokaLeeches_SpawningPC") > 0 then
                        player:setCharVar("KorrolokaLeeches_SpawningPC", 0)
                        npc:hideNPC(FORCE_SPAWN_QM_RESET_TIME)
                    end
                else
                    player:messageSpecial(ID.text.SENSE_OF_BOREBODING)
                    SpawnMob(ID.mob.KORROLOKA_LEECH_I)
                    SpawnMob(ID.mob.KORROLOKA_LEECH_II)
                    SpawnMob(ID.mob.KORROLOKA_LEECH_III)
                    player:setCharVar("KorrolokaLeeches_SpawningPC", 1)
                end
            else
                player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
            end
        else
            player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
        end
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end

end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
