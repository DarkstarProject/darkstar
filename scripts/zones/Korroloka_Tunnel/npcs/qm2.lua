-----------------------------------
-- Area: Korroloka Tunnel
--  NPC: ??? (qm2)
-- Involved In Quest: Ayame and Kaede
-- !pos -208 -9 176 173
-----------------------------------
package.loaded["scripts/zones/Korroloka_Tunnel/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Korroloka_Tunnel/TextIDs");
require("scripts/zones/Korroloka_Tunnel/MobIDs");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getQuestStatus(BASTOK,AYAME_AND_KAEDE) == QUEST_ACCEPTED) then
        if (player:getVar("AyameAndKaede_Event") == 2 and player:hasKeyItem(STRANGELY_SHAPED_CORAL) == false) then

            if (not GetMobByID(KORROLOKA_LEECH_I):isSpawned() and not GetMobByID(KORROLOKA_LEECH_II):isSpawned()
            and not GetMobByID(KORROLOKA_LEECH_III):isSpawned()) then
                if (player:getVar("KorrolokaLeeches_Killed") > 0) then
                    player:addKeyItem(STRANGELY_SHAPED_CORAL);
                    player:messageSpecial(KEYITEM_OBTAINED,STRANGELY_SHAPED_CORAL);
                    player:setVar("KorrolokaLeeches_Killed",0);

                    if (player:getVar("KorrolokaLeeches_SpawningPC") > 0) then
                        player:setVar("KorrolokaLeeches_SpawningPC",0);
                        npc:hideNPC(FORCE_SPAWN_QM_RESET_TIME);
                    end
                else
                    player:messageSpecial(SENSE_OF_BOREBODING);
                    SpawnMob(KORROLOKA_LEECH_I);
                    SpawnMob(KORROLOKA_LEECH_II);
                    SpawnMob(KORROLOKA_LEECH_III);
                    player:setVar("KorrolokaLeeches_SpawningPC", 1);
                end
            else
                player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
            end
        else
            player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
        end
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
