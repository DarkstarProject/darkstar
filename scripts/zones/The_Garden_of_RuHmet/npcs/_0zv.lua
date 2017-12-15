-----------------------------------
-- Area: The Garden of Ru'Hmet
--  NPC: particle gate
-----------------------------------
require("scripts/globals/keyitems");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:hasKeyItem(BRAND_OF_TWILIGHT)==false) then
        player:startEvent(111);
    end

    return 1;
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
  if (csid == 111 and option==1) then
      player:messageSpecial(KEYITEM_OBTAINED,BRAND_OF_TWILIGHT);
      player:addKeyItem(BRAND_OF_TWILIGHT);
  end
end;