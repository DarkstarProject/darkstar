-----------------------------------
-- Area: Korroloka Tunnel
-- NPC:  ??? (qm2)
-- Involved In Quest: Ayame and Kaede
-- @pos -208 -9 176 173
-----------------------------------
package.loaded["scripts/zones/Korroloka_Tunnel/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Korroloka_Tunnel/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (player:getQuestStatus(BASTOK,AYAME_AND_KAEDE) == QUEST_ACCEPTED) then
        if (player:getVar("AyameAndKaede_Event") == 2 and player:hasKeyItem(STRANGELY_SHAPED_CORAL) == false) then
            local leechesDespawned = (GetMobAction(17486187) == 0 and GetMobAction(17486188) == 0 and GetMobAction(17486189) == 0);
            local spawnTime = player:getVar("KorrolokaLeeches_Spawned");
            local canSpawn = (leechesDespawned and (os.time() - spawnTime) > 30);
            local killedLeeches = player:getVar("KorrolokaLeeches");

            if (killedLeeches >= 1) then
                if ((killedLeeches == 3 and (os.time() - player:getVar("KorrolokaLeeches_Timer") < 30)) or (killedLeeches < 3 and leechesDespawned and (os.time() - spawnTime) < 30)) then
                    player:addKeyItem(STRANGELY_SHAPED_CORAL);
                    player:messageSpecial(KEYITEM_OBTAINED,STRANGELY_SHAPED_CORAL);
                    player:setVar("KorrolokaLeeches",0);
                    player:setVar("KorrolokaLeeches_Spawned",0);
                    player:setVar("KorrolokaLeeches_Timer",0);
                elseif (leechesDespawned) then
                    SpawnMob(17486187,168); -- Despawn after 3 minutes (-12 seconds for despawn delay).
                    SpawnMob(17486188,168);
                    SpawnMob(17486189,168);
                    player:setVar("KorrolokaLeeches",0);
                    player:setVar("KorrolokaLeeches_Spawned",os.time()+180);
                    player:messageSpecial(SENSE_OF_BOREBODING);
                else
                    player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
                end
            elseif (canSpawn) then
                SpawnMob(17486187,168); -- Despawn after 3 minutes (-12 seconds for despawn delay).
                SpawnMob(17486188,168);
                SpawnMob(17486189,168);
                player:setVar("KorrolokaLeeches_Spawned",os.time()+180);
                player:messageSpecial(SENSE_OF_BOREBODING);
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

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;