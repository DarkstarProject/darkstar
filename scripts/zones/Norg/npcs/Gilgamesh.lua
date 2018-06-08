-----------------------------------
-- Area: Norg
--  NPC: Gilgamesh
-- !pos 122.452 -9.009 -12.052 252
-----------------------------------
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getCurrentMission(BASTOK) == THE_PIRATE_S_COVE and player:getVar("MissionStatus") == 2) then
        if (trade:hasItemQty(1160,1) and trade:getItemCount() == 1) then -- Frag Rock
            player:startEvent(99); -- Bastok Mission 6-2
        end
    end

end;

function onTrigger(player,npc)

    local ZilartMission = player:getCurrentMission(ZILART);

    if (ZilartMission == KAZAMS_CHIEFTAINESS) then
        player:startEvent(7);
    elseif (ZilartMission == THE_TEMPLE_OF_UGGALEPIH) then
        player:startEvent(8);
    elseif (ZilartMission == HEADSTONE_PILGRIMAGE) then
        player:startEvent(9);
    elseif (ZilartMission == RETURN_TO_DELKFUTTS_TOWER) then
        player:startEvent(13);
    elseif (ZilartMission == ROMAEVE) then
        player:startEvent(11);
    elseif (ZilartMission == THE_MITHRA_AND_THE_CRYSTAL) then
        player:startEvent(170);
    elseif (ZilartMission == ARK_ANGELS) then
        player:startEvent(171);
    elseif (ZilartMission == THE_CELESTIAL_NEXUS) then
        player:startEvent(173);
    elseif (ZilartMission == AWAKENING) then
        player:startEvent(177);
    end

end;

--0x00af  0x0000  0x0002  0x0003  0x0004  7  8  9  0x000a  0x0062  99  0x001d  0x000c
--13  0x0092  0x009e  0x00a4  0x00a9  170  171  0x00ac  173  0x00b0  177  0x00e8  0x00e9
--0x00ea
-- 0x0062  99 mission bastok
-- 0x000c parle de kuzotz ? parle de bijoux aussi
-- 0x000a parle de zitah
function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 99) then
        player:tradeComplete();
        player:setVar("MissionStatus",3);
    end

end;