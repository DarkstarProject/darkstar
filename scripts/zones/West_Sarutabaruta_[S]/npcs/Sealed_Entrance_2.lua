-----------------------------------
-- Area: West Sarutabaruta [S]
--  NPC: Sealed Entrance (Sealed_Entrance_2)
-- !pos 263.600 -6.512 40.000 95
-----------------------------------
package.loaded["scripts/zones/West_Sarutabaruta_[S]/TextIDs"] = nil;
-------------------------------------
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/zones/West_Sarutabaruta_[S]/TextIDs");
-----------------------------------

function onTrigger(player,npc)
    local QuestStatus = player:getQuestStatus(CRYSTAL_WAR, SNAKE_ON_THE_PLAINS);
    local HasPutty = player:hasKeyItem(dsp.kis.ZONPAZIPPAS_ALLPURPOSE_PUTTY);
    local MaskBit1 = player:getMaskBit(player:getVar("SEALED_DOORS"),0)
    local MaskBit2 = player:getMaskBit(player:getVar("SEALED_DOORS"),1)
    local MaskBit3 = player:getMaskBit(player:getVar("SEALED_DOORS"),2)

    if (QuestStatus == QUEST_ACCEPTED and HasPutty) then
        if (MaskBit2 == false) then
            if (MaskBit1 == false or MaskBit3 == false) then
                player:setMaskBit(player:getVar("SEALED_DOORS"),"SEALED_DOORS",1,true);
                player:messageSpecial(DOOR_OFFSET+1,dsp.kis.ZONPAZIPPAS_ALLPURPOSE_PUTTY);
            else
                player:setMaskBit(player:getVar("SEALED_DOORS"),"SEALED_DOORS",1,true);
                player:messageSpecial(DOOR_OFFSET+4,dsp.kis.ZONPAZIPPAS_ALLPURPOSE_PUTTY);
                player:delKeyItem(dsp.kis.ZONPAZIPPAS_ALLPURPOSE_PUTTY);
            end
        else
            player:messageSpecial(DOOR_OFFSET+2,dsp.kis.ZONPAZIPPAS_ALLPURPOSE_PUTTY);
        end
    elseif (player:getQuestStatus(CRYSTAL_WAR,SNAKE_ON_THE_PLAINS) == QUEST_COMPLETED) then
        player:messageSpecial(DOOR_OFFSET+2, dsp.kis.ZONPAZIPPAS_ALLPURPOSE_PUTTY);
    else
        player:messageSpecial(DOOR_OFFSET+3);
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