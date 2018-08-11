-----------------------------------
-- Area: Fort_Karugo-Narugo_[S] Zone 96
--  NPC: Pecca-Pocca
-- Involved In Quest: REQUIEM_FOR_THE_DEPARTED
-- !pos -162.978 -67.999 -155.099
-----------------------------------
package.loaded["scripts/zones/Fort_Karugo-Narugo_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Fort_Karugo-Narugo_[S]/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
	Rftd = player:getQuestStatus(CRYSTAL_WAR,REQUIEM_FOR_THE_DEPARTED);

    if (Rftd == QUEST_ACCEPTED) then
        if (player:hasKeyItem(dsp.ki.SHEAF_OF_HANDMADE_INCENSE)) then
            player:startEvent(233); -- standard dialogue after receiving KI
        else
            player:startEvent(234); -- to receive KI
        end
    else
        player:startEvent(233);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 234) then
        player:addKeyItem(dsp.ki.SHEAF_OF_HANDMADE_INCENSE);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.SHEAF_OF_HANDMADE_INCENSE);
    end

end;