-----------------------------------
-- Area: The Boyahda Tree
--  NPC: Mandragora Warden
-- Type: Mission NPC
-- !pos 81.981 7.593 139.556 153
-----------------------------------
local ID = require("scripts/zones/The_Boyahda_Tree/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
-----------------------------------

function onTrade(player,npc,trade)
local MissionStatus = player:getVar("MissionStatus");

    if (player:getCurrentMission(WINDURST) == DOLL_OF_THE_DEAD and (MissionStatus == 4 or MissionStatus == 5)) then
        if (trade:hasItemQty(1181,1) == true) and (trade:getItemCount() == 1) then
            player:startEvent(13);
        end
    end
end;

function onTrigger(player,npc)

local MissionStatus = player:getVar    ("MissionStatus");
local dialog = player:getVar ("mandialog");
    if (MissionStatus == 4) then
        if (dialog == 0) then
            player:startEvent(10);
            player:setVar("mandialog",1);
            player:PrintToPlayer("Seems like he wants something");
        elseif (dialog == 1) then
            player:startEvent(11);
            player:setVar("mandialog",2);
        elseif (dialog == 2) then
            player:startEvent(12);
            player:setVar("mandialog",3);
            player:PrintToPlayer("Seems like he wants some Gobbu Hummus");
        end
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 13) then
        player:setVar("MissionStatus",6);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.LETTER_FROM_ZONPAZIPPA);
        player:addKeyItem(dsp.ki.LETTER_FROM_ZONPAZIPPA);
    end
end;
