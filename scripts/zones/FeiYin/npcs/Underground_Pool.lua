-----------------------------------
-- Area: FeiYin
--  NPC: Underground Pool
-- Involved In Quest: Scattered into Shadow
-- !pos 7 0 32 204 (H-8)
-- !pos 7 0 247 204 (H-5)
-- !pos -168 0 247 204 (F-5)
-----------------------------------
package.loaded["scripts/zones/FeiYin/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/FeiYin/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getQuestStatus(JEUNO,SCATTERED_INTO_SHADOW) == QUEST_ACCEPTED) then
        local npcID = npc:getID();
        local aquaKI1 = player:hasKeyItem(AQUAFLORA1);
        local aquaKI2 = player:hasKeyItem(AQUAFLORA2);
        local aquaKI3 = player:hasKeyItem(AQUAFLORA3);
        local Z = player:getZPos();
        local X = player:getXPos();

        if ((Z > 20 and Z < 40) and (X > -.3 and X < 19.7) and (aquaKI1)) then
            player:startEvent(21);
        elseif ((Z > 242 and Z < 256) and (X > -2 and X < 16) and (aquaKI2)) then
            player:startEvent(20);
        elseif ((Z > 239 and Z < 259) and (X > -180 and X < -160) and (aquaKI3)) then
            if (player:getVar("DabotzKilled") == 1) then
                player:startEvent(18);
            else
                SpawnMob(17613129):updateClaim(player);
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

    if (csid == 21) then
        player:delKeyItem(AQUAFLORA1);
    elseif (csid == 20) then
        player:delKeyItem(AQUAFLORA2);
    elseif (csid == 18) then
        player:delKeyItem(AQUAFLORA3);
        player:setVar("DabotzKilled",0);
    end

end;